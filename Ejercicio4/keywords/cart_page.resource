*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${btn_checkout}    id=checkout

*** Keywords ***
Checkout
    Click Button    ${btn_checkout}