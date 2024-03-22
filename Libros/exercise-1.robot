*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser     ${url}    ${Browser}
Suite Teardown    Close All Browsers

*** Variables ***
${Browser}    Chrome
${url}     https://thepulper.herokuapp.com/apps/pulp/gui/
${Autor}    Isaac Asimov
${serie}    Robot
${editor}    Del Rey
${titulo}    I, Robot
${ISBN}    9780553382563
${anio}    2008

*** Tasks ***
Agregar Autor
    # Abrir navegador
    Mouse Over    id=menu-create-menu   
    Click Autor
    Ingresa Autor
    click crear
    Validar texto

Agregar Serie
    Mouse Over    id=menu-create-menu
    Click Serie
    Ingresa Serie
    click crear serie
    Validar texto Serie

Agregar Publisher
    Mouse Over    id=menu-create-menu
    Click Publisher
    Ingresa Publisher
    click crear Publisher
    Validar texto Publisher

Crear Libro
    Mouse Over    id=menu-create-menu
    Click Book
    ingresa Titulo
    selecciona autor
    selecciona editor
    selecciona serie
    ingresa Isbn
    ingresa anio
    click crear book
    Validar texto book
  #  [Teardown]    Close Browser

*** Keywords ***
#Abrir navegador
    #  Open Browser     ${url}    ${Browser}

Click Autor
    Wait Until Element Is Enabled     id=menu-create-author  
     Click Element     id=menu-create-author

Ingresa Autor
    Input Text    id=authorname    ${Autor}

click crear
     Click Button    id=createauthorbutton

Validar texto
    Wait Until Element Is Visible    id=outputmessage
    Element Text Should Be    id=outputmessage   Added Author

Click Serie
    Wait Until Element Is Enabled     id=menu-create-series  
     Click Element     id=menu-create-series

Ingresa Serie
    Input Text    id=seriesname    ${serie}

click crear serie
     Click Button    id=create

Validar texto serie
   Wait Until Element Is Visible    id=outputmessage
    Element Text Should Be    id=outputmessage   Added Publisher

Click Publisher
    Wait Until Element Is Enabled     id=menu-create-publisher 
     Click Element     id=menu-create-publisher 

Ingresa Publisher
    Input Text    id=publishername    ${editor}

click crear Publisher
     Click Button    id=create

Validar texto Publisher
   Wait Until Element Is Visible    id=outputmessage
    Element Text Should Be    id=outputmessage   Added Publisher

Click Book
    Wait Until Element Is Enabled     id=menu-create-book
     Click Element     id=menu-create-book
Ingresa titulo
    Input Text    id=booktitle    ${titulo}

selecciona autor
    Select From List By Label    xpath=//select[@id="authoridselect"]    ${Autor}  

selecciona editor
    Select From List By Label    xpath=//select[@id="publisheridselect"]    ${editor}  

selecciona serie
    Select From List By Label    xpath=//select[@id="seriesidselect"]    ${serie}   

ingresa Isbn
    Input Text    id=seriesidentifierid    ${ISBN}

ingresa anio
    Input Text    id=yearofPub    ${anio}

click crear book
     Click Button    id=create

Validar texto book
   Wait Until Element Is Visible    id=outputmessage
    Element Text Should Be    id=outputmessage   Added Book