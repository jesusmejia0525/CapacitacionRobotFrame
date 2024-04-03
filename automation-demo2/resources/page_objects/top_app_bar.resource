*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${barra_texto}=    //div[@class='oxd-topbar-header']/div[@class='oxd-topbar-header-title']
${menu}=    //li[@class='--active oxd-userdropdown']
${menu_opciones}=    //ul[@class='oxd-dropdown-menu']
${about}=    //ul[@class='oxd-dropdown-menu']/li/a[text()='About']
${support}=    //ul[@class='oxd-dropdown-menu']/li/a[text()='Support']    
${change_password}=    //ul[@class='oxd-dropdown-menu']/li/a[text()='Change Password']   
${ventana_fltante}=    //div[@class='oxd-sheet oxd-sheet--rounded oxd-sheet--white oxd-dialog-sheet oxd-dialog-sheet--shadow oxd-dialog-sheet--gutters']
${cerrar_ventana}=    //button[@class='oxd-dialog-close-button oxd-dialog-close-button-position']
${pagina_Support}=    //div[@class='orangehrm-card-container']
${pagina_change}=    //div[@class='orangehrm-card-container']
*** Keywords ***
Texto debe ser
    Wait Until Element Is Visible    ${barra_texto}
    ${texto}=    Get Text    ${barra_texto}
    [Arguments]    ${navbar_opcion}
    IF  $texto==$navbar_opcion
        Log To Console    TEXTO ES IGUAL
    END
Menu Usuario
    Click Element    ${menu}
    Wait Until Element Is Visible    ${menu_opciones}
    Click Element    ${about}
    Wait Until Element Is Visible    ${ventana_fltante}
    Click Element    ${cerrar_ventana}
    Wait Until Element Is Visible    ${menu}
    Click Element    ${menu}
    Wait Until Element Is Visible    ${menu_opciones}
    Click Element    ${support}
    Wait Until Element Is Visible    ${pagina_Support}
    Click Element    ${menu}
    Wait Until Element Is Visible    ${menu_opciones}
    Click Element    ${change_password}
