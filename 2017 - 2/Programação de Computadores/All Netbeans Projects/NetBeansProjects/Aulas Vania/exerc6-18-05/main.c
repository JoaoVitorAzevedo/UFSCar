#include <stdio.h>
#include <stdlib.h>

int main()
{
    //printf("Hello world!\n");
    //6. Declare dois ponteiros e os fa�a apontar para uma mesma posi��o de mem�ria. Imprima o resultado das opera��es relacionais (==, !=, >=, <=).

    int i;
    int *i1;
    int *i2;

    i1 = &i;
    i2 = &i;

    printf("Endereco ponteiro 1: %d\nEndereco ponteiro2: %d", i1, i2);




    return 0;
}
