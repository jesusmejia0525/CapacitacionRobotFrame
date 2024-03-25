*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${create_menu}=    id=menu-create-menu
${create_author}=    id=menu-create-author
${create_series}=    id=menu-create-series
${create_publisher}=    id=menu-create-publisher
${create_book}=    id=menu-create-book
*** Keywords ***
Open Create Author Page
    Mouse Over    ${create_menu}
    Wait Until Element Is Enabled    ${create_author}
    Click Element     ${create_author}

Open Create Series Page
    Mouse Over    ${create_menu}
    Wait Until Element Is Enabled     ${create_series}  
    Click Element     ${create_series}

Open Create Publisher Page
    Mouse Over    ${create_menu}
    Wait Until Element Is Enabled     ${create_publisher}  
    Click Element     ${create_publisher}

Open Create Book Page
    Mouse Over    ${create_menu}
    Wait Until Element Is Enabled     ${create_book}
    Click Element     ${create_book}