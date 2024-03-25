*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${author_name}=    id=authorname
${create_aut}=    id=createauthorbutton
${output_message}=    id=outputmessage

*** Keywords ***
Input Author
    [Arguments]    ${Autor}
    Wait Until Element Is Visible     ${author_name}
    Input Text    ${author_name}    ${Autor}

Create Author
    Click Button    ${create_aut}

Author Should Be Created
    Wait Until Element Is Visible    ${output_message}
    Element Text Should Be    ${output_message}   Added Author