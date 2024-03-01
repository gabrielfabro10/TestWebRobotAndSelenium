*** Settings ***
Documentation   Exemplo de tipo de variável: LISTA

*** Variable ***
@{MESES_DO_ANO}    janeiro    fevereiro    março    abril    maio    junho   julho    agosto    setembro    outubro    novembro    dezembro

*** Test Cases ***
Deve imprimir todos os meses do ano
    Imprime todos os meses do ano

*** Keywords ***
Imprime todos os meses do ano
    Log To Console   Mes1:${MESES_DO_ANO[0]} Mes2:${MESES_DO_ANO[1]} Mes3:${MESES_DO_ANO[2]} Mes4:${MESES_DO_ANO[3]} Mes5:${MESES_DO_ANO[4]} Mes6:${MESES_DO_ANO[5]} Mes7:${MESES_DO_ANO[6]} Mes8:${MESES_DO_ANO[7]} Mes9:${MESES_DO_ANO[8]} Mes10:${MESES_DO_ANO[9]} Mes11:${MESES_DO_ANO[10]} Mes12:${MESES_DO_ANO[11]}