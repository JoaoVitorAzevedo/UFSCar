DROP TABLE aluno_faz_atividade;
DROP TABLE cursa;
DROP TABLE oferta;
DROP TABLE atividade;
DROP TABLE disciplina_pre_req;
DROP TABLE disciplina;
DROP TABLE aluno;
DROP TABLE professor;

CREATE TABLE professor (
        num_prof        CHAR(6)         NOT NULL,
        cpf             CHAR(11)        NOT NULL,
        nome            VARCHAR(50)     NOT NULL,

        CONSTRAINT pk_professor PRIMARY KEY (num_prof)
);

CREATE TABLE aluno (
        ra              CHAR(6)         NOT NULL,
        cpf             CHAR(11)        NOT NULL,
        nome            VARCHAR(50)     NOT NULL,
        media_geral     NUMBER(2,1) DEFAULT 0.0,
        media_ponderada NUMBER(2,1) DEFAULT 0.0,

        CONSTRAINT pk_aluno PRIMARY KEY (ra)
);

CREATE TABLE disciplina (
        codigo          CHAR(6)         NOT NULL,
        nome            VARCHAR(20)     NOT NULL,
        ementa          VARCHAR(600),

        CONSTRAINT pk_disciplina PRIMARY KEY (codigo)
);

CREATE TABLE disciplina_pre_req (
        codigo          CHAR(6)         NOT NULL,
        pre_req         CHAR(6)         NOT NULL,

        CONSTRAINT pk_disc_pre_req PRIMARY KEY (codigo, pre_req),

        CONSTRAINT fk_disc_pre_req_codigo FOREIGN KEY (codigo)
            REFERENCES disciplina (codigo) ON DELETE CASCADE,
        CONSTRAINT fk_disc_pre_req FOREIGN KEY (pre_req)
            REFERENCES disciplina (codigo) ON DELETE CASCADE
);

CREATE TABLE atividade (
        codigo          CHAR(6)         NOT NULL,
        nome            VARCHAR(20)     NOT NULL,
        peso            INTEGER DEFAULT 1,
        data_entrega    DATE,
        cod_disciplina  CHAR(6)         NOT NULL,

        CONSTRAINT pk_atividade PRIMARY KEY (codigo),

        CONSTRAINT fk_atividade FOREIGN KEY (cod_disciplina)
            REFERENCES disciplina (codigo) ON DELETE CASCADE
);

CREATE TABLE oferta (
        num_prof                CHAR(6)         NOT NULL,
        codigo_disciplina       CHAR(6)         NOT NULL,
        semestre                CHAR(2),
        ano                     CHAR(4),

        CONSTRAINT pk_oferta PRIMARY KEY (num_prof,codigo_disciplina),

        CONSTRAINT fk_oferta_prof FOREIGN KEY (num_prof)
                REFERENCES professor (num_prof) ON DELETE CASCADE,
        CONSTRAINT fk_oferta_disc FOREIGN KEY (codigo_disciplina)
                REFERENCES disciplina (codigo) ON DELETE CASCADE
);

CREATE TABLE cursa (
        ra                      CHAR(6)         NOT NULL,
        codigo_disciplina       CHAR(6)         NOT NULL,
        num_prof                CHAR(6)         NOT NULL,
        status                  VARCHAR(15)     NOT NULL,
        nota                    NUMBER(3,1) check (nota between 0 and 10.0),
        frequencia              NUMBER(3,0)  check (frequencia between 0 and 100),

        CONSTRAINT pk_cursa PRIMARY KEY (ra,codigo_disciplina,num_prof),

        CONSTRAINT fk_cursa_ra FOREIGN KEY (ra)
                REFERENCES aluno (ra) ON DELETE CASCADE,
        CONSTRAINT fk_cursa_disciplina FOREIGN KEY (codigo_disciplina)
                REFERENCES disciplina (codigo) ON DELETE CASCADE,
        CONSTRAINT fk_cursa_num_prof FOREIGN KEY (num_prof)
                REFERENCES professor (num_prof) ON DELETE CASCADE
);

CREATE TABLE aluno_faz_atividade (
        codigo_atividade        CHAR(6)         NOT NULL,
        ra                      CHAR(6)         NOT NULL,
        status                  VARCHAR(15) DEFAULT 'N�o entregue'    NOT NULL ,
        nota                    NUMBER(2,1) ,

        CONSTRAINT pk_aluno_atividade PRIMARY KEY (ra,codigo_atividade),

        CONSTRAINT fk_aluno_atividade_ra FOREIGN KEY (ra)
                REFERENCES aluno (ra) ON DELETE CASCADE,
        CONSTRAINT fk_aluno_atividade_codigo FOREIGN KEY (codigo_atividade)
                REFERENCES atividade (codigo) ON DELETE CASCADE
);

INSERT INTO professor VALUES ('000001','34512845692','Carlos Alberto');
INSERT INTO professor VALUES ('000002','15946223162','Sandra Albuquerque');
INSERT INTO professor VALUES ('000003','78459612345','F�bio Pereira');
INSERT INTO professor VALUES ('000004','15462316452','L�cia Martins');
INSERT INTO professor VALUES ('000005','46213597888','Marcos Faria');
INSERT INTO professor VALUES ('000006','13457984655','Edgar Salles');
INSERT INTO professor VALUES ('000007','12947562332','Elaine Viera');
INSERT INTO professor VALUES ('000008','46512879598','Renan Serigoti');
INSERT INTO professor VALUES ('000009','43215326485','M�rcia Tavani');
INSERT INTO professor VALUES ('000010','43215326485','Vagner Teixeira');

INSERT INTO aluno VALUES ('801501','64652163144','Pedro Silva',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801502','49781235462','Guilherme Souza',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801503','45132789452','Mariane Medeiros',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801504','78465215632','Luciana Menegueti',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801505','84652648936','M�rio Torini',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801506','49853215873','Ana Kawano',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801507','46523584568','Enzo Giordoni',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801508','49873215632','Valentina Estrela',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801509','79843548238','Vitor Terashima',DEFAULT,DEFAULT);
INSERT INTO aluno VALUES ('801510','46548421230','Wen Su Shan',DEFAULT,DEFAULT);

INSERT INTO disciplina VALUES ('MAT001','C�LCULO I',
  '1. N�MEROS REAIS E FUN��ES DE UMA VARI�VEL REAL.2. LIMITES E CONTINUIDADE.3. C�LCULO DIFERENCIAL E APLICA��ES.4. C�LCULO INTEGRAL E APLICA��ES.');
INSERT INTO disciplina VALUES ('MAT002','C�LCULO II',
'1. S�RIES NUM�RICAS: CRIT�RIOS DE CONVERG�NCIA.2. S�RIES DE FUN��ES.3. FUN��ES REAIS DE V�RIAS VARI�VEIS.4. DIFERENCIABILIDADE DE FUN��ES DE V�RIAS VARI�VEIS.5. F�RMULA DE TAYLOR. M�XIMOS E M�NIMOS.6. TRANSFORMA��ES.7. TEOREMA DAS FUN��ES IMPL�CITAS.8. TEOREMA DA FUN��O INVERSA.');
INSERT INTO disciplina VALUES ('MAT003','Geometria Anal�tica',
'1. MATRIZES, DETERMINANTES E SISTEMAS LINEARES.2. VETORES; PRODUTOS ESCALAR, VETORIAL E MISTO.3. RETAS E PLANOS.4. CURVAS PLANAS.5. SUPERF�CIES.');
INSERT INTO disciplina VALUES ('COMP01','CAP',
  'E ACORDO COM OS OBJETIVOS NORTEADOS PELA DISCIPLINA, OS ASSUNTOS ABORDADOS SER�O: CARACTER�STICAS B�SICAS DOS COMPUTADORES: UNIDADES B�SICAS, INSTRU��ES, PROGRAMAS ARMAZENADOS, LINGUAGEM DE M�QUINA, ENDERE�AMENTO, LINGUAGENS DE PROGRAMA��O, SISTEMAS OPERACIONAIS, EQUIPAMENTOS PERIF�RICOS; SISTEMAS NUM�RICOS, ARITM�TICA BIN�RIA, C�DIGOS PONDERADOS E N�O PONDERADOS: REPRESENTA��O E CONVERS�ES DE BASES;');
INSERT INTO disciplina VALUES ('COMP02','Estruturas de Dados',
'Tipos abstratos de dados. Estruturas B�sicas: pilhas, filas, listas, �rvores e suas varia��es: listas circulares, listas duplamente encadeadas, listas ordenadas, �rvores bin�rias, �rvores bin�rias de busca, �rvores bin�rias de busca balanceadas. Representa��o, manipula��o e algoritmos: inser��o, elimina��o, busca e percurso. Conceitos sobre implementa��o de estruturas de dados: aloca��o est�tica, aloca��o din�mica, aloca��o seq�encial.');
INSERT INTO disciplina VALUES ('BIO001','BIOLOGIA GERAL',
'ESTRUTURA, COMPOSI��O QU�MICA, FORMA E FUN��O DA MAT�RIA VIVA. HIERARQUIA ORGANIZACIONAL DA C�LULA AO ECOSSISTEMA. RELA��ES DA ORGANIZA��O ORG�NICA COM O MEIO F�SICO-QU�MICO. FORMAS DE VIDA, OCORR�NCIA E DISTRIBUI��O NO MEIO. CICLO CELULAR, CICLOS BIOGEOQU�MICOS, CICLOS BIOL�GICOS, RITMOS E SUCESS�O ECOL�GICA. CONDI��ES QU�MICAS E F�SICAS PARA A SOBREVIV�NCIA, COMPETI��O, CRESCIMENTO E REPRODU��O DOS SERES VIVOS. GERA��O DA BIODIVERSIDADE NOS DIVERSOS N�VEIS DE ORGANIZA��O DA VIDA.');
INSERT INTO disciplina VALUES ('BIO002','Palentologia',
'Bioestrationomia e tipos de fossiliza��o. Origem da vida e biotas pr�-cambrianas. Paleoicnologia. Paleobot�nica. Micropaleontologia. Paleobot�nica. Paleoinvertebrados. Paleovertebrados. Estudo de caso i: a ocupa��o do meio terrestre. Estudo de caso ii: a origem e evolu��o do homem.');
INSERT INTO disciplina VALUES ('ECO001','ECONOMIA MATEM�TICA',
'A natureza da economia matem�tica. Modelos matem�ticos. An�lise de equil�brio. Limite e derivadas: conceito, c�lculo e aplica��es econ�micas. Otimiza��o de fun��es de uma vari�vel e aplica��es econ�micas. Representa��o gr�fica de fun��es de duas vari�veis. Otimiza��o de fun��es de mais de uma vari�vel e aplica��es em economia. O teorema da fun��o impl�cita e a est�tica comparativa.');
INSERT INTO disciplina VALUES ('LET001','Portugu�s',
'- CI�NCIA DA LINGUAGEM. - DESENVOLVIMENTO DA EXPRESS�O ORAL. - LEITURA E AN�LISE. - PRODU��O DE TEXTOS.');
INSERT INTO disciplina VALUES ('QUI001','QU�MICA I',
'ESTRUTURA AT�MICA.ESTRUTURA MOLECULAR.OS ESTADOS DA MAT�RIA E AS FOR�AS INTERMOLECULARES.');

CREATE OR REPLACE TRIGGER TGR_APROVADO
    BEFORE DELETE OR INSERT OR UPDATE ON cursa
    FOR EACH ROW
  WHEN (new.nota >= 6.0 AND new.frequencia >=75)
  BEGIN
      :new.status := 'Aprovado';
  END; 
/

CREATE OR REPLACE TRIGGER TGR_REC
    BEFORE DELETE OR INSERT OR UPDATE ON cursa
    FOR EACH ROW
  WHEN (new.nota >= 5.0 AND new.nota < 6.0 AND new.frequencia >=75)
  BEGIN
      :new.status := 'Recupera��o';
  END; 
/

CREATE OR REPLACE TRIGGER TGR_REPROVADO
    BEFORE DELETE OR INSERT OR UPDATE ON cursa
    FOR EACH ROW
  WHEN (new.nota < 5.0 OR new.frequencia <75)
  BEGIN
      :new.status := 'Reprovado';
  END; 
/


INSERT INTO cursa VALUES ('801510','MAT001','000004','Aprovado',6.0,91);

INSERT INTO cursa VALUES ('801503','MAT001','000004','Aprovado',5.0,91);

INSERT INTO cursa VALUES ('801502','MAT001','000004','Aprovado',6.0,32);
SELECT * FROM cursa where ra = '801503';

INSERT INTO cursa VALUES ('801501','LET001','000007','Recupera��o',5.0,70);
INSERT INTO cursa VALUES ('801505','QUI001','000010','Reprovado',DEFAULT,DEFAULT);
INSERT INTO cursa VALUES ('801504','COMP01','000001','Aprovado',6.2,75);
INSERT INTO cursa VALUES ('801503','COMP01','000003','Recupera��o',5.7,80);
INSERT INTO cursa VALUES ('801506','COMP01','000004','Aprovado',7.6,82);
INSERT INTO cursa VALUES ('801510','COMP01','000001','Cursando',DEFAULT,DEFAULT);
INSERT INTO cursa VALUES ('801508','BIO001','000007','Reprovado',4.0,88);
INSERT INTO cursa VALUES ('801502','BIO001','000007','Reprovado',2.5,44);
INSERT INTO cursa VALUES ('801504','BIO002','000001','Aprovado',8.2,90);
INSERT INTO cursa VALUES ('801509','BIO001','000003','Aprovado',9.7,77);
INSERT INTO cursa VALUES ('801501','BIO002','000007','Recupera��o',5.0,70);
INSERT INTO cursa VALUES ('801505','BIO001','000010','Cursando',DEFAULT,DEFAULT);
INSERT INTO cursa VALUES ('801504','BIO001','000001','Aprovado',6.9,100);
INSERT INTO cursa VALUES ('801503','BIO002','000003','Recupera��o',5.7,79);


INSERT INTO disciplina_pre_req VALUES('COMP01','COMP02');
INSERT INTO disciplina_pre_req VALUES('BIO002','BIO001');
INSERT INTO disciplina_pre_req VALUES('ECO001','MAT001');
INSERT INTO disciplina_pre_req VALUES('MAT002','MAT001');


INSERT INTO atividade VALUES ('ATIV01','Trabalho1', 1, DEFAULT,'COMP01');
INSERT INTO atividade VALUES ('ATIV02','Lista 1', 1, TO_DATE('06-03-2018','dd-mm-yyyy'),'COMP01');
INSERT INTO atividade VALUES ('ATIV03','Prova 1', 2, TO_DATE('06-05-2018','dd-mm-yyyy'),'MAT001');


SELECT * FROM professor;
SELECT * FROM aluno;
SELECT * FROM disciplina;

-- [CONSULTAS]
-- [Jun��o Impl�cita]
-- 1. Liste o nome das disciplinas que s�o ofertadas no periodo 2018/2 
SELECT d.nome
    FROM disciplina d, oferta o
        WHERE d.codigo = o.codigo_disciplina AND
        o.semestre = '02' AND
        o.ano = '2018';
      
-- 2. Mostre as notas de todos os alunos que j� cursaram disciplinas da biologia, agrupado por disciplina
SELECT d.nome AS disciplina, c.nota
    FROM cursa c
        JOIN disciplina d
        ON d.codigo = c.codigo_disciplina
            WHERE d.codigo LIKE 'BIO%' AND c.status != 'Cursando'
                ORDER BY d.nome;
                      
-- 3. Liste todos os alunos que nunca foram reprovados, e mostre suas respectivas medias gerais
SELECT a.nome AS alunos_sem_reprova, a.media_geral
    FROM aluno a
        WHERE a.ra  NOT IN 
        (SELECT c.ra 
            FROM cursa c 
                WHERE c.status = 'Reprovado'
        );                      

-- [Jun��o Interna]
-- 1. Selecione os nomes dos alunos que cursam ou cursaram CAP
SELECT a.nome
    FROM  aluno a 
        JOIN cursa c 
        ON a.ra = c.ra 
            JOIN disciplina d 
            ON c.codigo_disciplina = d.codigo
                WHERE d.nome = 'CAP' 
                    ORDER BY c.nota DESC;   
                    
-- [Jun��o Externa]
-- todas as disciplinas e seus pre requisitos,caso existam
SELECT d.nome AS disciplina, pr.nome AS pr�_requisito
    FROM disciplina d 
        LEFT OUTER JOIN disciplina_pre_req dpr
        ON d.codigo = dpr.codigo 
            LEFT OUTER JOIN disciplina pr 
            ON dpr.pre_req = pr.codigo
                ORDER BY d.nome;
    

-- [Agrega��o]
-- 1. Mostre a m�dia geral total dos alunos
SELECT AVG(media_geral)
FROM aluno;

-- 2. Mostre a media de todos alunos para cada disciplina
SELECT codigo_disciplina, AVG(nota)
    FROM cursa
        GROUP BY codigo_disciplina
            ORDER BY AVG(nota) DESC;
            
-- 3. Conte o numero de atividades por disciplina
SELECT d.nome AS disciplina, COUNT(atv.codigo) AS num_ativ
    FROM disciplina d 
        LEFT OUTER JOIN atividade atv 
        ON d.codigo = atv.cod_disciplina
            GROUP BY d.nome
                ORDER BY num_ativ DESC;

--atualizar uma tabela adicionando um campo;
ALTER TABLE professor
ADD especializacao VARCHAR(25);

-- atualizar as tuplas da tabela, atualizando o valor do campo adicionado;
UPDATE professor SET especializacao = 'Topologia'                 WHERE num_prof = '000001';
UPDATE professor SET especializacao = 'Grafos'                    WHERE num_prof = '000002';
UPDATE professor SET especializacao = '�lgebra Linear'            WHERE num_prof = '000003';
UPDATE professor SET especializacao = 'Bot�nica'                  WHERE num_prof = '000004';
UPDATE professor SET especializacao = 'Redes'                     WHERE num_prof = '000005';
UPDATE professor SET especializacao = 'Aprendizado de M�quina'    WHERE num_prof = '000006';
UPDATE professor SET especializacao = 'Radia��o'                  WHERE num_prof = '000007';
UPDATE professor SET especializacao = 'Economia Solid�ria'        WHERE num_prof = '000008';
UPDATE professor SET especializacao = 'Fon�tica'                  WHERE num_prof = '000009';
UPDATE professor SET especializacao = 'Banco de Dados'            WHERE num_prof = '000010';

SELECT * FROM professor;
