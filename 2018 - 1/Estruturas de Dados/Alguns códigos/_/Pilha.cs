﻿using System;


public class Pilha   
{

    int[] elementos;
    int topo;



    public Pilha()
    {
        elementos = new int[10];
        topo = -1;


    }


    public void Empilha(int e)
    {

        if (!Cheia()){
            topo++;
            elementos[topo] = e;
        }
        else { throw new Exception("Deu tudo errado"); }

    }

    public void Desempilha(int* e)
    {
        if (!Vazia)
        {
            e = elementos.topo;
            topo--;
            // retorna e ? 
        }
        else { throw new Exception("Deu tudo errado"); }


    }

    public boolean Cheia(int e)
    {
        return (topo == (elementos.length - 1));

    }

    public boolean Vazia(int e)
    {


    }

    public void Cria(int e)
    {


    }

}

