*** Settings ***
Library    RPA.Excel.Files

*** Keywords ***
Read Data From Excel File
    [Arguments]    ${file}    ${sheet}=${None}
    Open Workbook    path=${file}    data_only=${True}    read_only=${True}
    ${data}=    Read Worksheet    name=${sheet}    header=${True}
    Close Workbook
    [Return]    ${data}

Write Data To Excel File
    [Arguments]    ${data}    ${file}    ${sheet}=${None}
    Create Workbook    fmt=xlsx    sheet_name=${sheet}
    Append Rows To Worksheet    content=${data}    header=${True}
    Save Workbook    path=${file}
    Close Workbook