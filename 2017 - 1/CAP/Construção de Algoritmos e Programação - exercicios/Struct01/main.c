#include <stdio.h>
#include <stdlib.h>

enum tipo {motorista, secretario = 10, docente, outros};

typedef enum tipo tTipo;

struct funcionario
{
int codFunc; // c�digo do funcion�rio
int idadeFunc; // idade do funcion�rio
char sexoFunc; // sexo do funcion�rio, M (masculino) e F (feminino)
float salFunc; // sal�rio do funcion�rio
char nomeFunc[81]; // nome do funcion�rio
tTipo tipoFunc; // tipo do funcion�rio
};

int main(int argc, char *argv[])
{
  struct funcionario funcionario1, funcionario2;

  // inicialializa��o do funcion�rio 1
  // comandos de atribui��o

  funcionario1.codFunc = 1;
  funcionario1.idadeFunc = 38;
  funcionario1.sexoFunc = 'M';
  funcionario1.salFunc = 5000.89;
  strcpy(funcionario1.nomeFunc,"Ricardo");
  // funcionario1.tipoFunc = 1;
  funcionario1.tipoFunc = docente;

  // impress�o dos dados do funcion�rio 1

  printf("os dados do funcionario 1 sao: \n");
  printf("codFunc = %d\n", funcionario1.codFunc);
  printf("idadeFunc = %d\n", funcionario1.idadeFunc);
  printf("sexoFunc = %c\n", funcionario1.sexoFunc);
  printf("salFunc = %f\n", funcionario1.salFunc);
  printf("nomeFunc = %s\n", funcionario1.nomeFunc);

  // printf("tipoFunc = %d\n", funcionario1.tipoFunc);

  switch(funcionario1.tipoFunc)
  {
     case 1 :
       printf("tipoFunc = motorista\n");
       break;

     case 10 :
       printf("tipoFunc = secretario\n");
       break;

     case 11 :
       printf("tipoFunc = docente\n");
       break;

     case 12 :
       printf("tipoFunc = outros\n");
       break;
  }

  printf("\n");

  // inicializa�ao dos dados do funcion�rio 2

  printf("Digite os dados do funcionario 2: \n");

  printf("Digite o codigo: ");
  scanf("%d", &funcionario2.codFunc);
  fflush(stdin);

  printf("Digite a idade: ");
  scanf("%d", &funcionario2.idadeFunc);
  fflush(stdin);

  printf("Digite o sexo: ");
  funcionario2.sexoFunc = getchar();
  fflush(stdin);

  printf("Digite o salario: ");
  scanf("%f", &funcionario2.salFunc);
  fflush(stdin);

  printf("Digite o nome: ");
  gets(funcionario2.nomeFunc);
  fflush(stdin);

  printf("Tipo do Funcionario\n");
  printf("1 - Motorista\n");
  printf("10 - Secretario\n");
  printf("11 - Docente\n");
  printf("12 - Outros\n");

  printf("Digite o tipo: ");
  scanf("%d", &funcionario2.tipoFunc);
  fflush(stdin);

  // impress�o dos dados do funcion�rio 2

  printf("os dados do funcionario 2 sao: \n");
  printf("codFunc = %d\n", funcionario2.codFunc);
  printf("idadeFunc = %d\n", funcionario2.idadeFunc);
  printf("sexoFunc = %c\n", funcionario2.sexoFunc);
  printf("salFunc = %f\n", funcionario2.salFunc);
  printf("nomeFunc = %s\n", funcionario2.nomeFunc);

  // printf("tipoFunc = %d\n", funcionario1.tipoFunc);

  switch(funcionario2.tipoFunc)
  {
     case 1 :
       printf("tipoFunc = motorista\n");
       break;

     case 2 :
       printf("tipoFunc = secretario\n");
       break;

     case 3 :
       printf("tipoFunc = docente\n");
       break;

     case 4 :
       printf("tipoFunc = outros\n");
       break;
  }

  // compara��o dos funcionarios

  if (funcionario1.tipoFunc == funcionario2.tipoFunc)
    printf("Os funcionarios sao do mesmo tipo\n\n");
  else
    printf("Os funcionarios sao de tipos diferentes\n\n");

  funcionario2 = funcionario1;

  if (funcionario1.tipoFunc == funcionario2.tipoFunc)
    printf("Os funcionarios sao do mesmo tipo\n\n");
  else
    printf("Os funcionarios sao de tipos diferentes\n\n");


  // finaliza��o do programa

  system("PAUSE");
  return 0;
}
