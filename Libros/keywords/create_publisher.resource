*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${publisher_name}=    id=publishername
${create_pub}=    id=create
${output_message}=    id=outputmessage

*** Keywords ***
Input Publisher
    [Arguments]    ${publisher}
    Wait Until Element Is Visible    ${publisher_name}
    Input Text    ${publisher_name}    ${publisher}

Create Publisher
    Click Button    ${create_pub}

Publisher Should Be Created
    Wait Until Element Is Visible    ${output_message}
    Element Text Should Be    ${output_message}   Added Publisher