#include <stdio.h>
#include <stdlib.h>

int main()
{
   // printf("Hello world!\n");
   // 7. Declare dois ponteiros: um gen�rico e um para double. Leia um valor para uma vari�vel double. Imprima o conte�do da vari�vel usando o ponteiro gen�rico.
    void **vpointer;
    double *dpointer;
    double d;

    printf("Informe um valor decimal: ");
    scanf("%lf", &d);
        dpointer = &d;
        vpointer = (double*)dpointer;
        printf("Endereco:  %d\n outro endereco %d", vpointer, dpointer);
    return 0;
}
