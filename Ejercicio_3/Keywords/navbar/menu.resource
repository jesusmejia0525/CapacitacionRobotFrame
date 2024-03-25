*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${reports_menu}=    id=menu-reports-menu
${books}=    id=menu-books-report-table
${admin_menu}=    id=menu-admin-menu
${filter}=    id=menu-admin-filter
*** Keywords ***
Open Book Reports Page
    Mouse Over    ${reports_menu}
    Wait Until Element Is Enabled    ${books}
    Click Element    ${books}

Open Admin FIlter Page
    Mouse Over    ${admin_menu}
    Wait Until Element Is Enabled    ${filter}
    Click Element    ${filter}