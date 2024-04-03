*** Settings ***
Library    SeleniumLibrary
Library    String 

*** Variables ***
${menu_opcion_plantilla}=    //li[@class='oxd-main-menu-item-wrapper']//span[text()='{placeholder}']

*** Keywords ***
Navegar A
    [Arguments]    ${opcion}
    ${menu_opcion}=    Replace String    ${menu_opcion_plantilla}    {placeholder}    ${opcion}
    Wait Until Element Is Visible    ${menu_opcion}
    Click Element      ${menu_opcion}