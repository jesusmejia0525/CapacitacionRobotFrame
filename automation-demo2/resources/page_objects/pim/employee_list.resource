*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${Fila_tr}=    //div[@class='oxd-table-cell oxd-padding-cell']
${Columna_th}=    //div[@class='oxd-table-header-cell oxd-padding-cell oxd-table-th']
${tabla}=    //div[@class='oxd-table orangehrm-employee-list']
${paginacion}=    //button[contains(@class, 'oxd-pagination-page-item--page')]
${tabla_busqueda}=    //div[contains(@class, 'oxd-table-filter')]
${inp_nombre}=    //form/div[1]/div/div[1]/div/div[2]/div/div/input
${inp_idemp}=    //form/div[1]/div/div[2]/div/div[2]/input
${slt_estatus}    //form/div[1]/div/div[3]/div/div[2]/div
${slt_filtroEmp}    //form/div[1]/div/div[4]/div/div[2]/div/div
${inp_nombre_super}    //form/div[1]/div/div[5]/div/div[2]/div/div
${slt_tituloP}    //form/div[1]/div/div[6]/div/div[2]/div/div
${slt_subUni}    //form/div[1]/div/div[7]/div/div[2]/div/div
${btn_buscar}    //button[contains(@class, 'oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space')]
${opt_listas}    //div[contains(@class, 'oxd-select-dropdown --positon-bottom')]
${label_listas}    //div[contains(@class,'oxd-select-dropdown --positon-bottom')]/div[contains(@class,'oxd-select-option')]/span[text()='{placeholder}']

*** Keywords ***
Leer datos de Empleados
    Wait Until Element Is Visible    ${paginacion}
    ${rows}=    Get Element Count    ${Fila_tr}
    ${cols}=    Get Element Count    ${Columna_th}

    @{columnas}    Get WebElements    ${Columna_th}
    @{paginas}=    Get WebElements    ${paginacion}
    
   # Log To Console    Filas: ${rows}
    #Log To Console    Columnos:${cols}
    Log To Console    paginas:${paginas}

    ${cells}=    Create List
    ${cabecera}=    Create List
    FOR    ${titulo}    IN    @{columnas}
        ${titulos}=    Get Element Attribute    ${titulo}    innerText
        Append To List    ${cabecera}    ${titulos}
    END
    Log To Console    Lista de titulos${cabecera}
    
    FOR    ${pagina}    IN    @{paginas}
        Click Element    ${pagina}
        Wait Until Element Is Visible    ${Fila_tr}
        @{filas}=    Get WebElements    ${Fila_tr}
        FOR    ${cell}    IN    @{filas}
            Wait Until Element Is Visible    ${Fila_tr}
            ${text}=    Get Element Attribute    ${cell}    innerText
            #${data}=    Evaluate    [cell.text for cell in $datos]
            Append To List   ${cells}    ${text} 
        END
    END
    Log to console   lista de datos:${cells}

    # ${dict}=    Evaluate    dict(zip($cabecera, $cells))
    # Log To Console    ${dict}

#    RETURN   
Buscar Empleado
    Wait Until Element Is Visible    ${tabla_busqueda}
    [Arguments]    ${nombre_emp}    ${id_emp}    ${estatus_emp}    ${Filtro_emp}    ${nombre_super}    ${titulo_puesto}    ${sub_unit}
    IF  $nombre_emp!=""
        Input Text    ${inp_nombre}    ${nombre_emp}
    END
    IF  $id_emp!=""
        Input Text    ${inp_idemp}    ${id_emp}
    END
    IF  $estatus_emp!=""
        Click Element    ${slt_estatus} 
        Wait Until Element Is Visible    ${opt_listas}
        ${lavel_opcion}=    Replace String    ${label_listas}    {placeholder}    ${estatus_emp}
        Click Element    ${lavel_opcion}
    END
    IF  $Filtro_emp!=""
        Click Element    ${slt_filtroEmp}
        Wait Until Element Is Visible    ${opt_listas}
        ${lavel_opcion}=    Replace String    ${label_listas}    {placeholder}    ${Filtro_emp}
        Click Element    ${lavel_opcion}
    END
    IF  $nombre_super!=""
        Input Text    ${inp_nombre_super}    ${nombre_super}
    END
    IF  $titulo_puesto!=""
        Click Element    ${slt_tituloP}
        Wait Until Element Is Visible    ${opt_listas}
        ${lavel_opcion}=    Replace String    ${label_listas}    {placeholder}    ${titulo_puesto}
        Click Element    ${lavel_opcion}
    END
    IF  $sub_unit!=""
        Click Element    ${slt_subUni}
        Wait Until Element Is Visible    ${opt_listas}
        ${lavel_opcion}=    Replace String    ${label_listas}    {placeholder}    ${sub_unit}
        Click Element    ${lavel_opcion}
    END 

    Click Button    ${btn_buscar}