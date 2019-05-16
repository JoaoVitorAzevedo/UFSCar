#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef char *String;
typedef String Chave;
typedef int Valor;

void stInit(int);
void stInsert(Chave, Valor);
Valor stSearch(Chave);
void stDelete(Chave);
void stFree();

void *mallocSafe(int nbytes)
{
    void *p;
    p = malloc(nbytes);
    if (p == NULL)
    {
        printf("ERRO! Malloc devolveu NULL\n");
        exit(EXIT_FAILURE);
    }
    return p;
}

static String copyString(String string)
{
    String str = NULL;
    int len = strlen(string) + 1;
    str = mallocSafe(len * sizeof(char));
    strncpy(str, string, len);
    return str;
}

// implementação com hash table e sondagem linear

#define LIVRE(h) (tab[h].chave == NULL)
#define INCR(h) (h = h == M - 1 ? 0 : h + 1)

typedef struct celTS CelTS;
struct celTS
{
    Chave chave;
    Valor valor;
};

static CelTS *tab = NULL;
static int nChaves = 0;
static int M; // tamanho da tabela

// int hash(Chave chave, int M)
// {
//     return chave % M;
// }

// int hash(Chave chave, int M)
// {
//     return (17 * chave + 43) % M;
// }

int hash(Chave chave, int M)
{
    int i, h = 0;
    int primo = 127;
    for (i = 0; chave[i] != '\0'; i++)
        h = (h * primo + chave[i]) % M;
    return h;
}

void stInit(int max)
{
    int h;
    M = max;
    nChaves = 0;
    tab = mallocSafe(M * sizeof(CelTS));
    for (h = 0; h < M; h++)
        tab[h].chave = NULL;
}

void stInsert(Chave chave, Valor valor)
{
    CelTS *p;
    int h = hash(chave, M);
    while (!LIVRE(h) && strcmp(tab[h].chave, chave) != 0)
        INCR(h);
    if (LIVRE(h))
    {
        if (nChaves == M - 1)
        {
            printf("Tabela cheia\n");
            return;
        }
        tab[h].chave = copyString(chave);
        nChaves++;
    }
    tab[h].valor = valor;
}

Valor stSearch(Chave chave)
{
    int h = hash(chave, M);
    while (!LIVRE(h) && strcmp(tab[h].chave, chave) != 0)
        INCR(h);
    if (!LIVRE(h))
        return tab[h].valor;
    return 0;
}

void stDelete(Chave chave)
{
    int h = hash(chave, M);
    while (!LIVRE(h) && strcmp(tab[h].chave, chave) != 0)
        INCR(h);
    if (LIVRE(h))
        return;
    // remover a chave da tabela
    free(tab[h].chave);
    tab[h].chave = NULL;
    nChaves--;
    // reespalhar as chaves seguintes
    for (INCR(h); !LIVRE(h); INCR(h))
    {
        Chave chave = tab[h].chave;
        Valor valor = tab[h].valor;
        tab[h].chave = NULL;
        stInsert(chave, valor);
        free(chave);
    }
}

void stFree()
{
    int h;
    for (h = 0; h < M; h++)
        if (!LIVRE(h))
            free(tab[h].chave);
    free(tab);
    tab = NULL;
    nChaves = 0;
}

int main()
{
    int x;
    x = -11;
    printf("-11 resto 2: %d\n", x % 2);

    return 0;
}
