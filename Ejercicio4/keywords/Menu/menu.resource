*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${btn_hamburger}=    id=react-burger-menu-btn
${logout}=    id=logout_sidebar_link

*** Keywords ***
Logout
    Click Button    ${btn_hamburger}
    Wait Until Element Is Visible    ${logout}
    Click Element    ${logout}