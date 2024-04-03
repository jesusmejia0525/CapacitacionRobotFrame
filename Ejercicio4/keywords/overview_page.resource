*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${btn_finish}=    id=finish
${div_precio}=    //div[@class='summary_total_label']

*** Keywords ***
Print Price In Console
    ${precio}    Get Text    ${div_precio}
    ${p1}    ${p2}=    Split String From Right   ${precio}    separator=${SPACE}
    ${p2}=    Remove String    ${p2}    $
    Log To Console        ${p2}
    Click Button    ${btn_finish}