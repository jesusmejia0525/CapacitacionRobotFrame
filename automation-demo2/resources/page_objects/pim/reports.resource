*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${contenedor_reportes}=    //div[@class='orangehrm-container']
${contenedor_datos}=    //div[@class='content-wrapper']
${titulos_tabla}=        //div[@class='rgHeaderCell']
${datos_tabla}=    //div[@class='rgCell']
${paginacion}=    //button[contains(@class, 'oxd-pagination-page-item oxd-pagination-page-item--page')]
${btn_ReporteAllEmployee}=    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div[1]/div/div[3]/div/button[3]
${btn_ReporteContactInfo}=    //div[text()='Employee Contact info report']/../..//button[3]
${btn_ReporteJobDetails}=    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div[3]/div/div[3]/div/button[3]

*** Keywords ***
Reporte Informacion Contacto Empleado
    Wait Until Element Is Visible     ${btn_ReporteContactInfo}
    Click Button    ${btn_ReporteContactInfo}
    Wait Until Element Is Visible    ${contenedor_datos}
    @{paginas}=    Get WebElements    ${paginacion}
    @{cabecera_tabla}=    Get WebElements    ${titulos_tabla}
    ${Lista_titulo}=    Create List
    ${tabla}=    Create List
    FOR  ${titulos_repoteContacto}  IN  @{cabecera_tabla}
        ${texto_titulos}=    Get Element Attribute    ${titulos_repoteContacto}    innerText
        Append To List    ${Lista_titulo}    ${texto_titulos}
    END
    Log To Console    ${Lista_titulo}
    
    FOR  ${paginaDatos}  IN  @{paginas}
        Click Element    ${paginaDatos}
        Wait Until Element Is Visible    ${contenedor_datos}
        @{filas}=     Get WebElements    //div[@class='rgRow']
        FOR  ${fila}  IN  @{filas}
            @{valores}=    Create List
            Log To Console    ${datos_tabla} 
            Execute Javascript    arguments[0].scrollTop = arguments[0].scrollHeinght    ${fila}
            @{celdas_datos}=    Evaluate    $fila.find_elements(by='xpath', value=".${datos_tabla}")
            FOR  ${celda}  IN  @{celdas_datos}
                #${texto_celdas}=    Get Element Attribute    ${celda}    innerText
                Append To List    ${valores}    ${celda.text}
            END
            ${dict}=    Evaluate    dict(zip($Lista_titulo, $valores))
            Append To List    ${tabla}    ${dict}
        END
    END
    RETURN    ${tabla}

Reporte contacto 
    Wait Until Element Is Visible     ${btn_ReporteContactInfo}
    Click Button    ${btn_ReporteContactInfo}
    Wait Until Element Is Visible    ${contenedor_datos}
    ${tabla}=    Create List
    @{paginas}=    Get WebElements    ${paginacion}
    # Iterar páginas
    FOR    ${pagina}    IN    @{paginas}
        Click Element    ${pagina}
        Wait Until Element Is Visible    ${contenedor_datos}
        ${datos_pagina}=    Execute Javascript
        ...    const grid = document.querySelector('revo-grid');
        ...    return grid.source;
        ${tabla}=    Combine Lists    ${tabla}    ${datos_pagina}
    END
    #Log To Console    ${tabla}
    Log To Console    ${{len($tabla)}}
    RETURN    ${tabla}