#include <stdio.h>
#include <stdlib.h>

int main()
{
    /* Neste problema voc� dever� ler 15 valores coloc�-los em 2
    vetores conforme estes valores forem pares ou �mpares. S� que
     o tamanho de cada um dos dois vetores � de 5 posi��es. Ent�o,
      cada vez que um dos dois vetores encher, voc� dever� imprimir
       todo o vetor e utiliz�-lo novamente para os pr�ximos n�meros
       que forem lidos. Terminada a leitura, deve-se imprimir o conte�do
       que restou em cada um dos dois vetores, imprimindo primeiro os valores
        do vetor impar. Cada vetor pode ser preenchido tantas vezes quantas for
            necess�rio.
Entrada
A entrada cont�m 15 n�meros inteiros.

Sa�da

Imprima a sa�da conforme o exemplo abaixo.  */
int  vImpar[5]; int  contImpar = 0;
int  vPar[5];  int contPar =  0;
int i = 0; int j  = 0;  int  k  = 0;
int  num;

while(i<15){
    scanf("%d", &num);
    if(num%2 ==  0){
        vPar[contPar]  =  num;
        contPar++;
        if(contPar == 5){
            for(j=0;j<5;j++){
                    if(vPar[j] !=  0){
                printf("par[%d] = %d\n", j, vPar[j]);
                vPar[j]  = 0;
           }
                contPar = 0;
            }
        }
    }


    else  if(num%2 !=  0){
        vImpar[contImpar]  =  num;
        contImpar++;
        if(contImpar == 5){
            for(k=0;k<5;k++){
                    if(vImpar[k] !=  0){
                printf("impar[%d] = %d\n", k, vImpar[k]);
                vImpar[k] = 0;
                }
                contImpar = 0;
            }
    }


}
i++;

}

for(i=0;i<5;i++){
    if(vImpar[i] != 0)
        printf("impar[%d] = %d\n", i, vImpar[i]);
}
for(i=0;i<5;i++){

    if(vPar[i] != 0)
    printf("par[%d] = %d\n", i, vPar[i]);

}





    return 0;
}
