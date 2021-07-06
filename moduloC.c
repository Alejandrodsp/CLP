#define MAXPalavra 20
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *ler_arquivo(char *palavra, char *texto);
int contar_quantas_vezes_a_string_aparece(char *palavra, char *texto);

int main()
{
    char *palavra, *texto;

    palavra = (char *)malloc(MAXPalavra * sizeof(char));
    texto = (char *)malloc(1 * sizeof(char));

    if ((texto = ler_arquivo(palavra, texto)) != NULL)
    {
        printf("String a ser buscada: %s\n", palavra);
        printf("              Texto\n%s\n", texto);
        printf("A string %s foi encontrada %d vezes no texto\n", palavra, contar_quantas_vezes_a_string_aparece(palavra, texto));
    }

    free(palavra);
    free(texto);
    return 0;
}

// L� o arquivo
char *ler_arquivo(char *palavra, char *texto)
{
    char nome_arquivo[MAXPalavra];
    int i;
    FILE *arquivo;
    i = 0;

    printf("Informe o nome do arquivo: ");
    scanf("%s", nome_arquivo);

    arquivo = fopen(nome_arquivo, "r");
    if (arquivo == NULL)
    {
        printf("Falha ao abrir o arquivo");
        return NULL;
    }
    else
    {
        fscanf(arquivo, "%s", palavra);
        fgetc(arquivo);//para pegar o \n que sobra na leitura da primeira linha
        while (!feof(arquivo))
        {
        char c;
            if (!fscanf(arquivo, "%c", &c))
            {
                break;
            }

            texto[i] = c;
            i++;
            texto = (char *)realloc(texto, (i + 1) * sizeof(char));
        }

        texto[i-1] = '\0'; //-1 porque estava armazenando duas vezes o ultimo caracter
        fclose(arquivo);
    }

    return texto;
}
