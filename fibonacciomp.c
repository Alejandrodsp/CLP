//Trabalho controle de frequencia CLP
//Calculo de fibonacci usando OpenMP
//Alejandro da Silva Pereira
#include <omp.h>
#include <stdio.h>

unsigned long int fibonacci(int n)
{
    unsigned long int i, j;
    if (n < 2)
        return n;
    else
    {
#pragma omp task shared(i)
        i = fibonacci(n - 1);
#pragma omp task shared(j)
        j = fibonacci(n - 2);
#pragma omp taskwait
        return i + j;
    }
}

int main()
{
    int numero;
    unsigned long int resultado;
    
    printf("Fibonacci com OpenMP\n");
    printf("Informe o N: ");
    scanf("%d", &numero);
    resultado = fibonacci(numero);
    printf("Fibonacci de %d = %lu\n", numero, resultado);


    return 0;
}