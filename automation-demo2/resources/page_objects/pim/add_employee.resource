*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/navigation.resource


*** Variables ***
${contenedor}=    //div[@class='orangehrm-employee-container']
${inp_nombreAdd}=    //input[@name='firstName']
${inp_apellidoP}=    //input[@name='middleName']
${inp_apellidoM}=    //input[@name='lastName']
${inp_id}=    //form/div[1]/div[2]/div[1]/div[2]/div/div/div[2]/input
${btn_save}=    //form/div[2]/button[2]
${resultado}=    //div[@id='oxd-toaster_1']

*** Keywords ***
Agregar Empleado
    [Arguments]    ${nombre}    ${apellidoP}    ${apellidoM}    ${id}
    Wait Until Element Is Visible    ${contenedor}
    Wait Until Element Is Visible    ${inp_nombreAdd}
    Input Text    ${inp_nombreAdd}    ${nombre}
    Wait Until Element Is Visible    ${inp_apellidoP}
    Input Text    ${inp_apellidoP}    ${apellidoP}
    Wait Until Element Is Visible    ${inp_apellidoM}
    Input Text    ${inp_apellidoM}    ${apellidoM}  
    Wait Until Element Is Visible    ${inp_id}
    Input Text    ${inp_id}    ${id}
    Click Button    ${btn_save}

Agregar Empleaodos Excel
    [Arguments]    ${datosEmpl}
    FOR  ${FilaExcel}  IN  @{datosEmpl}
        Navegar a PIM modulos    Add Employee  
        Wait Until Element Is Visible    ${inp_nombreAdd}
        Input Text    ${inp_nombreAdd}    ${FilaExcel}[First Name]
        Wait Until Element Is Visible    ${inp_apellidoP}
        Input Text    ${inp_apellidoP}    ${FilaExcel}[Middle Name]
        Wait Until Element Is Visible    ${inp_apellidoM}
        Input Text    ${inp_apellidoM}    ${FilaExcel}[Last Name]
        Wait Until Element Is Visible    ${inp_id}
        Input Text    ${inp_id}    58
        Wait Until Element Is Enabled    ${btn_save}
        Click Button    ${btn_save}
        Wait Until Element Is Visible    ${resultado}
    END
    
   