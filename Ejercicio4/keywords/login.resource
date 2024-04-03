*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inp_user}=    id=user-name
${inp_password}=    id=password
${btn_login}=    id=login-button

*** Keywords ***
Login
    [Arguments]    ${user}    ${password}
    Input Text    ${inp_user}    ${user}
    Input Text    ${inp_password}    ${password}
    Click Button    ${btn_login}