*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inp_username}=    //div/input[@name='username']
${inp_password}=    //div/input[@name='password']
${btn_login}=    //button[text()=' Login ']

*** Keywords ***
Iniciar Sesion
    [Arguments]    ${user}    ${password}
    Wait Until Element Is Visible    ${inp_username}
    Input Text    ${inp_username}    ${user}
    Input Text    ${inp_password}    ${password}
    Click Button    ${btn_login}