*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${url}     https://opensource-demo.orangehrmlive.com/web/auth/login

*** Keywords ***
Open navigator
    Open browser    ${url}    ${Browser}

Close navigator 
    Close All Browsers