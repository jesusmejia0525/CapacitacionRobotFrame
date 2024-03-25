*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${series_name}=    id=seriesname
${create_ser}=    id=create
${output_message}=    id=outputmessage

*** Keywords ***
Input Series
    [Arguments]    ${serie}
    Wait Until Element Is Visible    ${series_name}
    Input Text    ${series_name}    ${serie}

Create Series
    Click Button    ${create_ser}

Series Should Be Created
    Wait Until Element Is Visible    ${output_message}
    Element Text Should Be    ${output_message}   Added Publisher