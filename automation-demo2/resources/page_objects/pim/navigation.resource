*** Settings *** 
Library    SeleniumLibrary
Library    String

*** Variables ***
${opciones_navbarPIM}=    //li[contains(@class, 'oxd-topbar-body-nav-tab')]/a[text()='{placeholder}']


*** Keywords ***
Navegar a PIM modulos
    [Arguments]    ${opcion}
    ${opcion_PIM}=    Replace String    ${opciones_navbarPIM}    {placeholder}    ${opcion}
    Wait Until Element Is Visible    ${opcion_PIM}
    Click Element    ${opcion_PIM}

