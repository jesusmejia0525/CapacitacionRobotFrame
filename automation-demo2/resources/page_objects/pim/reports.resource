*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${contenedor_datos}=    //div[@class='content-wrapper']
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
    ${tabla}=    Create List
    ${numPa}=    Get Element Count    ${paginacion}
    @{paginas}=    Get WebElements    ${paginacion}
    # Iterar páginas
    IF  $numPa>0
        FOR    ${pagina}    IN    @{paginas}
            Click Element    ${pagina}
            Wait Until Element Is Visible    ${contenedor_datos}
            ${datos_pagina}=    Execute Javascript
            ...    const grid = document.querySelector('revo-grid');
            ...    return grid.source;
            ${tabla}=    Combine Lists    ${tabla}    ${datos_pagina}
        END
    ELSE
        Wait Until Element Is Visible    ${contenedor_datos}
        ${datos_pagina}=    Execute Javascript
        ...    const grid = document.querySelector('revo-grid');
        ...    return grid.source;
        ${tabla}=    Combine Lists    ${tabla}    ${datos_pagina}
    END
    #Log To Console    ${tabla}
    Log To Console    ${{len($tabla)}}
    RETURN    ${tabla}