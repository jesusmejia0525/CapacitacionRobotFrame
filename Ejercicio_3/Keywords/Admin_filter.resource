*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${rb_style}=    style
${rb_data}=    navigation
${chkB_search}=    id=search-term
${Inp_search}=    id=search-term-text
${chkB_paginate}=    id=pagination
${Slt_page-template}=    id=page-template
${btn_viewB}=    id=filter-submit-button
${table_bokks}=    //table[@id='bookslisttable']

  

*** Keywords ***
Select Rendering Stily
    [Arguments]    ${style}
    Select Radio Button    ${rb_style}    ${style}

Select Data Is
    [Arguments]    ${data}
    Select Radio Button    ${rb_data}    ${data}

Select Search and Input text
    [Arguments]    ${search}
    IF  "${search}"!="${EMPTY}"
        Select Checkbox    ${chkB_search}
        Input Text     ${Inp_search}     ${search}
    END

Select Paginate
    [Arguments]    ${boolean_value}
    IF    $boolean_value
        Select Checkbox    ${chkB_paginate}
    END
Select Page Template
    [Arguments]    ${PAGE}
    Select From List By Label    ${Slt_page-template}    ${PAGE} 

Clic View Books
    Click Button    ${btn_viewB}

Capture Screemshot
    Wait Until Element Is Visible    ${table_bokks}
    Capture Element Screenshot    ${table_bokks}    filename=Tabla_Libros.png

    
        




    




