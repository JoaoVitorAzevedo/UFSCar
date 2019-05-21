#include <stdio.h>
#include <stdlib.h>



void swap(int* a, int* b)
{
    int t = *a;
    *a = *b;
    *b = t;
}

int partition (int arr[], int low, int high)
{
	int pivot = arr[high]; // pivot
	int i = (low - 1); // Index of smaller element

	for (int j = low; j <= high- 1; j++)
	{
		// If current element is smaller than or
		// equal to pivot
		if (arr[j] >= pivot)                                                                    ////
		{
			i++; // increment index of smaller element
			swap(&arr[i], &arr[j]);
		}
	}
	swap(&arr[i + 1], &arr[high]);
	return (i + 1);
}

/* The main function that implements QuickSort
arr[] --> Array to be sorted,
low --> Starting index,
high --> Ending index */
void quickSort(int arr[], int low, int high)
{
	if (low < high)
	{
		/* pi is partitioning index, arr[p] is now
		at right place */
		int pi = partition(arr, low, high);

		// Separately sort elements before
		// partition and after partition
		quickSort(arr, low, pi - 1);
		quickSort(arr, pi + 1, high);
	}
}

/* Function to print an array */
void printArray(int arr[], int size)
{
	int i;
	for (i=0; i < size; i++)
		printf("%d ", arr[i]);
	printf("\n");
}

int main()
{

    int qtd; int total = 0;
    scanf("%d",&qtd);
    int vetor[qtd];

   int   i = 0; char temp = 'c';


  do
    {
        scanf("%d%c", &vetor[i], &temp);
        i++;
    }
    while (i<qtd);

   // printArray(vetor,qtd);

    quickSort(vetor,0,qtd-1);
  //  printArray(vetor,qtd);


    for(i=0;i<qtd -2;i+=3){
    //printf("meu i %d \n",i);

        total += vetor[i + 2];



    }
    printf("%d", total);







    return 0;
}
