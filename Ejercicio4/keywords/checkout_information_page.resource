*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ipt_name}=    id=first-name
${ipt_Lastname}=    id=last-name
${ipt_postacode}=    id=postal-code
${btn_continue}=    id=continue

*** Keywords ***
Enter Data Information
    [Arguments]    ${name}    ${last_name}    ${postal_code}
    Input Text    ${ipt_name}    ${name}
    Input Text    ${ipt_Lastname}    ${last_name}
    Input Text    ${ipt_postacode}    ${postal_code}
    Click Button    ${btn_continue}

