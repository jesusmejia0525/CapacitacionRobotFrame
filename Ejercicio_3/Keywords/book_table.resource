*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Fila_tr}=    //table[@id='bookslisttable']/tbody/tr
${Columna_th}=    //table[@id='bookslisttable']/tbody/tr[1]/th
${table_name}=    //table[@id='bookslisttable']

*** Keywords ***
Print in console book with initial in vowel
    Wait Until Element Is Visible    ${table_name}
    ${rows}=    Get Element Count    ${Fila_tr}
    ${cols}=    Get Element Count    ${Columna_th}
    FOR    ${row}    IN RANGE    1    ${rows} + 1
        ${cells}=    Create List
        FOR    ${col}    IN RANGE    1    ${cols} + 1
            ${cell}=    Get Table Cell    ${table_name}    ${row}    ${col}
            Append To List    ${cells}    ${cell}
        END
        IF    $cells[0].startswith('A') or $cells[0].startswith('E') or $cells[0].startswith('I') or $cells[0].startswith('O') or $cells[0].startswith('U')
            Log To Console    ${cells}
        END

    END