*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/keywords/create_author.resource
Resource    ${CURDIR}/keywords/create_series.resource
Resource    ${CURDIR}/keywords/create_publisher.resource
Resource    ${CURDIR}/keywords/create_book.resource
Resource    ${CURDIR}/keywords/navbar/create.resource
Suite Setup    Open Browser     ${url}    ${Browser}
Suite Teardown    Close All Browsers

*** Variables ***
${Browser}    Chrome
${url}     https://thepulper.herokuapp.com/apps/pulp/gui/
${Autor}    Isaac Asimov
${serie}    Robot
${editor}    Del Rey
${titulo}    I, Robot
${ISBN}    9780553382563
${anio}    2008

*** Tasks ***
Agregar Autor
    Open Create Author Page
    Input Author    ${Autor}
    Create Author
    Author Should Be Created

Agregar Serie
    Open Create Series Page
    Input Series    ${serie}
    Create Series
    Series Should Be Created

Agregar Publisher
    Open Create Publisher Page
    Input Publisher    ${editor}
    Create Publisher
    Publisher Should Be Created

Crear Libro
    Open Create Book Page
    Input title    ${titulo}
    Select Author    ${Autor}
    Select Publisher    ${editor}
    Select Series    ${serie}
    Input Series Identifier    ${ISBN}
    Input Year    ${anio}
    Create Book
    Book Should Be Created