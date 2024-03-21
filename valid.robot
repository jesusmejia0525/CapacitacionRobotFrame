*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${Login-Url}    http://localhost:3100/html
${Browser}    googlechrome
*** Test Cases ***
Valid Login
    Open Browser To Login page
    Type In Username  demo
    Type In Password  mode
    Submit Credentials
    Welcome Page Should Be Open 
    [Teardown]    Close Browser


*** Keywords *** 
Open Browser To Login page
     Open Browser     ${Login-Url}    ${Browser}
     Title Should Be    Login Page

Type In Username
    [Arguments]     ${username}
    Input Text    id=username_field    ${username}
    
Type In Password
    [Arguments]     ${password}
    Input Text    id=password_field    ${password}

Submit Credentials
    Click Button    id=login_button

Welcome Page Should Be Open 
    Title Should Be    Welcome Page