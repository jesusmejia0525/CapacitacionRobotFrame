*** Settings ***
Library    SeleniumLibrary


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
    Abrir navegador
    Mouse Over    id=menu-create-menu
    Click Autor
    Ingresa Autor
    click crear
    Set Selenium Speed	0.5 seconds
    Validar texto

*** Keywords ***
Abrir navegador
     Open Browser     ${url}    ${Browser}
Click Autor
     Click Link     /apps/pulp/gui/create/author
Ingresa Autor
    Input Text    id=authorname    ${Autor}
click crear
     Click Button    id=createauthorbutton
Validar texto
    Element Text Should Be    id=outputmessage   Added Author
    
*** Tasks ***
Agregar Serie
    Mouse Over    id=menu-create-menu
    Click Serie
    Ingresa Serie
    click crear serie
    Validar texto Serie

*** Keywords ***
Click Serie
     Click Link     /apps/pulp/gui/create/series
Ingresa Serie
    Input Text    id=seriesname    ${serie}
click crear serie
     Click Button    id=create
Validar texto serie
    Element Text Should Be    id=outputmessage   Added Publisher

*** Tasks ***
Agregar Publisher
    Mouse Over    id=menu-create-menu
    Click Publisher
    Ingresa Publisher
    click crear Publisher
    Validar texto Publisher

*** Keywords ***
Click Publisher
     Click Link     /apps/pulp/gui/create/publisher
Ingresa Publisher
    Input Text    id=publishername    ${editor}
click crear Publisher
     Click Button    id=create
Validar texto Publisher
    Element Text Should Be    id=outputmessage   Added Publisher

*** Tasks ***
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
       [Teardown]    Close Browser

*** Keywords ***
Click Book
     Click Link     /apps/pulp/gui/create/book
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
    Element Text Should Be    id=outputmessage   Added Book