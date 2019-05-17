#include <stdio.h>
#include <stdlib.h>



int dataJuliana(int dia, int mes, int ano);
int main()
{
    /*Escreva uma fun��o dataJuliana que possui como par�metros formais 3 valores
    inteiros correspondendo aos valores de dia, m�s e ano de uma data e retorna o
     n�mero de dias transcorridos no ano em quest�o.
     Considere a seguinte defini��o de ano bissexto:
- um ano n�o div�sivel por 100 e divis�vel por 4 � bissexto
- um ano divis�vel por 100 e divis�vel por 400 � bissexto
- os demai anos n�o s�o bissextos.
*/  int dia, mes, ano;
scanf("%d %d %d", &dia, &mes, &ano);
    int i = dataJuliana(dia,mes,ano);

    printf("%d", i);
    return 0;
}

int dataJuliana(int dia, int mes, int ano){
    int bissexto = 0;
    if(ano%100 != 0 && ano%4 == 0)
        bissexto = 1;
    else if(ano%100 == 0 && ano%400 == 0)
        bissexto = 1;
    else{
            bissexto = 0;
    }

    if(bissexto)
        return 366;
    else{
            return 365;
    }
}





