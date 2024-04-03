*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/keywords/login.resource
Resource    ${CURDIR}/keywords/products_page.resource
Resource    ${CURDIR}/keywords/cart_page.resource
Resource    ${CURDIR}/keywords/checkout_information_page.resource
Resource    ${CURDIR}/keywords/overview_page.resource
Resource    ${CURDIR}/keywords/Menu/menu.resource
Suite Setup    Open Browser     ${url}    ${Browser}
Suite Teardown    Close All Browsers

*** Variables ***
${Browser}    Chrome
${url}     https://www.saucedemo.com/
@{productos}=    Sauce Labs Bike Light
${name}=    John
${last_name}=    Doe
${CP}=    12345

*** Tasks ***
Iniciar Sesion
    login    standard_user    secret_sauce
    ${producto}=    Create List   @{productos}
    Add Products To Cart    ${producto}
    Open Cart
    Checkout
    Enter Data Information    ${name}    ${last_name}    ${CP}
    Print Price In Console
    Logout
    

