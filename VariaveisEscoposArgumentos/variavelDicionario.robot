*** Settings ***
Documentation   Exemplo de tipo de variável: LISTA

*** Variable ***
&{MESES_DO_ANO}    janeiro=janeiro   fevereiro=fevereiro    março=março    abril=abril    maio=maio    junho=junho   julho=julho    agosto=agosto    setembro=setembro    outubro=outubro    novembro=novembro    dezembro=dezembro

*** Test Cases ***
Deve imprimir todos os meses do ano
    Imprime todos os meses do ano

*** Keywords ***
Imprime todos os meses do ano
    Log To Console    Janeiro: ${MESES_DO_ANO.janeiro}
    Log To Console    Fevereiro: ${MESES_DO_ANO.fevereiro}
    Log To Console    Março: ${MESES_DO_ANO.março}
    Log To Console    Abril: ${MESES_DO_ANO.abril}
    Log To Console    Maio: ${MESES_DO_ANO.maio}
    Log To Console    Junho: ${MESES_DO_ANO.junho}
    Log To Console    Julho: ${MESES_DO_ANO.julho}
    Log To Console    Agosto: ${MESES_DO_ANO.agosto}
    Log To Console    Setembro: ${MESES_DO_ANO.setembro}
    Log To Console    Outubro: ${MESES_DO_ANO.outubro}
    Log To Console    Novembro: ${MESES_DO_ANO.novembro}
    Log To Console    Dezembro: ${MESES_DO_ANO.dezembro}