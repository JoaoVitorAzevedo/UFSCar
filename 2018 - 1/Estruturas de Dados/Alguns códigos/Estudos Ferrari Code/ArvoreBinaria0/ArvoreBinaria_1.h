typedef int TipoChave;


/* Percorre-se a AB recursivamente
- Pr�-ordem: visita o n� antes de acessar qualquer um dos seus filhos
- Em-ordem: visita o n� entre o acesso a cada um de seus dois filhos
- P�s-ordem: visita o n� somente depois de acessar seus filhos */

typedef struct {
    TipoChave Chave;
} TipoItem;

typedef struct TipoNo{
    TipoItem Item;
    struct TipoNo *esq, *dir;
} TipoNo;

typedef struct TipoNo *TipoApontador;
typedef TipoApontador TipoArvore;



void CriaArvore(){

}
void CriaRaiz(){


}

void InsereDireita(){

}

void InsereEsquerda(){

}

void visita(TipoArvore A){
        printf("%c \n", A->.Item.Chave);
}

void preOrdem(TipoArvore A){
    if(A != NULL){
        visita(A);
        preOrdem(A->Esq);
        preOrdem(A->dir);
    }
}
void emOrdem(TipoArvore A){
    if(A != NULL){
        emOrdem(A->esq);
        visita(A);
        emOrdem(A->dir);
    }

}

void posOrdem(TipoArvore A){
    if(A != NULL){
        posOrdem(A->esq);
        posOrdem(A->dir);
        visita(A);
    }
}
