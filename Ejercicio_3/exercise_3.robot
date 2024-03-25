*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Keywords/navbar/menu.resource
Resource    ${CURDIR}/Keywords/book_table.resource
Resource    ${CURDIR}/Keywords/Admin_filter.resource
Suite Setup    Open Browser     ${url}    ${Browser}
Suite Teardown    Close All Browsers

*** Variables ***
${Browser}    Chrome
${url}     https://thepulper.herokuapp.com/apps/pulp/gui/

*** Tasks ***
Reporte de libors
    Open Book Reports Page
    Print in console book with initial in vowel

Admin filtro de libros
    Open Admin FIlter Page
    Select Rendering Stily    table
    Select Data Is    static
    Select Search and Input text    man
    Select Paginate    false
    Select Page Template    List
    Clic View Books
    Capture Screemshot