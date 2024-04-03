*** Settings ***
Library    Collections
Resource    ${CURDIR}/../resources/shared/excel.resource

*** Tasks ***
Read Excel File
    [Documentation]    Read data from an Excel file and log it
    [Tags]    read
    ${data}=    Read Data From Excel File    ${CURDIR}/../data/sample.xlsx
    FOR    ${row}    IN    @{data}
        Log Dictionary    ${row}
    END

Write Excel File
    [Documentation]    Write data to an Excel file
    [Tags]    write
    ${data_a}=    Create Dictionary    id=0295    first_name=99N75 425    last_name=5TlV    job_title=${EMPTY}
    ${data_b}=    Create Dictionary    id=0002    first_name=Odis    last_name=Adalwin    job_title=Chief Technical Officer (Deleted)
    ${data}=    Create List    ${data_a}    ${data_b}
    Write Data To Excel File    ${data}    ${OUTPUT_DIR}/sample.xlsx
