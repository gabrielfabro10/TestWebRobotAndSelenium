*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${LOCATOR_TEXT}    //input[contains(@type,'text')]
${SUBMIT}    nav-search-submit-text
${ADD_TO_CART}    //input[contains(@name,'submit.add-to-cart')]
${MESSAGE_SUCCESS_ADD_CART}    Adicionado ao carrinho
${GO_TO_CART}    //a[contains(@data-csa-c-type,'button')]
${DELETE_PRODUCT}    //input[contains(@value,'Excluir')]
${MESSAGE_CART_ESAVAZIED}    Subtotal (0 produtos)

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=${LOCATOR_TEXT}    text=${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${SUBMIT}

Verificar o resultado da pesquisa, se está listando o produto "${NOME_PRODUTO}".
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${NOME_PRODUTO}')]
    Page Should Contain Image    locator=//img[contains(@alt,'${NOME_PRODUTO}')]

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"
E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"
Quando pesquisar pelo produto "${NOME_PRODUTO}"
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
E um produto da linha "${NOME_PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "${NOME_PRODUTO}".
Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Click Element    locator=//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'][contains(.,'${NOME_PRODUTO}')]
    
    Click Element    locator=${ADD_TO_CART}
Verificar se o produto "Xbox Série S - 1TB (preto)" foi adicionado com sucesso
    Wait Until Page Contains    text=${MESSAGE_SUCCESS_ADD_CART}

Remover o produto "Xbox Série S - 1TB (preto)" do carrinho
    Click Element   locator=${GO_TO_CART}

    Click Element    locator=${DELETE_PRODUCT}

Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=${MESSAGE_CART_ESAVAZIED}

Quando adicionar o produto "${NOME_PRODUTO}" no carrinho
    Adicionar o produto "${NOME_PRODUTO}" no carrinho

Então o produto "${NOME_PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso

E existe o produto "${NOME_PRODUTO}" no carrinho
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Verificar se o produto "Xbox Série S - 1TB (preto)" foi adicionado com sucesso

Quando remover o produto "${NOME_PRODUTO}" do carrinho
    Remover o produto "Xbox Série S - 1TB (preto)" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio