integer function contar_quantas_vezes_a_string_aparece(palavra, texto) bind(C, name='contar_quantas_vezes_a_string_aparece')
    use, intrinsic :: iso_c_binding
    implicit none
    integer :: tamanho_primeira_palavra, i, j, k, contador
    character(kind=c_char), dimension(20), intent(IN) :: palavra
    character(kind=c_char), dimension(*), intent(IN) :: texto

    tamanho_primeira_palavra = 0

    do
        if (palavra(tamanho_primeira_palavra + 1) == C_NULL_CHAR) exit
        tamanho_primeira_palavra = tamanho_primeira_palavra + 1
    end do

    i = 0
    contador = 0

    do
        if (texto(i + 1) == C_NULL_CHAR) exit
        if (texto(i + 1) == palavra(1)) then
            j = i
            k = 2

            do
                i = i + 1

        if (texto(i + 1) == C_NULL_CHAR) exit
                if (texto(i + 1) == palavra(k)) then
                    if (k == tamanho_primeira_palavra) then
                        contador = contador + 1
                        exit
                    end if
                    k = k + 1
                else
                    exit
                end if
            end do

            i = j + 1
        else
            i = i + 1
        end if
    end do

    contar_quantas_vezes_a_string_aparece = contador
    return
end function contar_quantas_vezes_a_string_aparece
