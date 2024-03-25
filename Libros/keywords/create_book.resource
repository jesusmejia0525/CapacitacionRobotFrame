*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${book_title}=    id=booktitle
${select_author}=    xpath=//select[@id="authoridselect"]
${select_publisher}=    xpath=//select[@id="publisheridselect"]
${select_series}=    xpath=//select[@id="seriesidselect"]
${seriesidentifierid}=    id=seriesidentifierid
${year}=    id=yearofPub
${create_bo}=    id=create
${output_message}=    id=outputmessage

*** Keywords ***
Input title
    [Arguments]    ${title}
    Wait Until Element Is Enabled     ${book_title}
    Input Text    ${book_title}    ${title}

Select Author
    [Arguments]    ${Autor}
    Wait Until Element Is Enabled     ${select_author}
    Select From List By Label    ${select_author}    ${Autor} 

Select Publisher
    [Arguments]    ${editor}
    Wait Until Element Is Enabled     ${select_publisher}
    Select From List By Label    ${select_publisher}    ${editor} 

Select Series
    [Arguments]    ${serie}
    Wait Until Element Is Enabled     ${select_series}
    Select From List By Label    ${select_series}    ${serie} 

Input Series Identifier
    [Arguments]    ${ISBN}
    Wait Until Element Is Enabled     ${seriesidentifierid}
    Input Text    ${seriesidentifierid}    ${ISBN}

Input Year
    [Arguments]    ${anio}
    Wait Until Element Is Enabled     ${year}
    Input Text    ${year}    ${anio}

Create Book
    Click Button    ${create_bo}

Book Should Be Created
    Wait Until Element Is Visible    ${output_message}
    Element Text Should Be    ${output_message}   Added Book