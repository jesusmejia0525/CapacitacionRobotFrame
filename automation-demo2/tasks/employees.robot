*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../resources/page_objects/pim/navigation.resource
Resource    ${CURDIR}/../resources/page_objects/top_app_bar.resource
Resource    ${CURDIR}/../resources/page_objects/pim/employee_list.resource
Resource    ${CURDIR}/../resources/page_objects/pim/add_employee.resource
Resource    ${CURDIR}/../resources/page_objects/pim/reports.resource
Resource    ${CURDIR}/../resources/shared/excel.resource
Resource    ${CURDIR}/../resources/shared/setup_teardown.resource
Resource    ${CURDIR}/../resources/page_objects/login.resource
Resource    ${CURDIR}/../resources/page_objects/navigation.resource
Task Setup    Open navigator
Task Teardown    Close navigator

*** Variables ***
#------Datps Inicio Sesion----#
${username}=    Admin
${password}=    admin123
#---Datos Busqueda Empleado----#
${nombre_emp}=    Pedro Infante
${id_emp}=
${estatus_emp}=
${Filtro_emp}=
${nombre_super}=
${titulo_puesto}=
${sub_unit}=
#------datos Agregar empleado-----#
${nombre}=    Pedro
${apellidoP}=    Infante
${apellidoM}=    Cruz
${id}=    11

*** Tasks ***
Get Employee List
    [Documentation]
    ...    Get the list of employees from the Employee List page in the PIM module
    [Tags]    get-list
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Leer datos de Empleados
    Menu Usuario

Get Employee
    [Documentation]
    ...    Get the details of an employee from the Employee List page in the PIM module
    [Tags]    get
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Buscar Empleado     ${nombre_emp}    ${id_emp}    ${estatus_emp}    ${Filtro_emp}    ${nombre_super}    ${titulo_puesto}    ${sub_unit}
    Menu Usuario
    
Add Employee
    [Documentation]
    ...    Add a new employee from the Add Employee page in the PIM module
    [Tags]    add
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Navegar a PIM modulos    Add Employee
    Agregar Empleado    ${nombre}    ${apellidoP}    ${apellidoM}    ${id}
    Menu Usuario

Add Multiple Employees
    [Documentation]
    ...    Add multiple employees from the Add Employee page in the PIM module
    [Tags]    add-multiple
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    ${dataExcel}=    Read Data From Excel File    ${CURDIR}/../data/empleados.xlsx
    Agregar Empleaodos Excel    ${dataExcel}
    Menu Usuario
    
Get Employee Sub Unit Hierarchy Report
    [Documentation]
    ...    Get the sub unit hierarchy of employees from the Reports page in the PIM module
    [Tags]    get-report-sub-unit
    # La Aplicacion esta inestable y no pudo ser desarrollada esta tarea
    No Operation

Get Employee Contact Info Report
    [Documentation]
    ...    Get the contact information of employees from the Reports page in the PIM module
    [Tags]    get-report-contact-info
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Navegar a PIM modulos    Reports
    ${tablas}=    Reporte Informacion Contacto Empleado
    Write Data To Excel File    ${tablas}    ${OUTPUT_DIR}/ReporteContacto.xlsx
    Menu Usuario

Get Employee Job Details Report
    [Documentation]
    ...    Get the job details of employees from the Reports page in the PIM module
    [Tags]    get-report-job-details
    # La Aplicacion esta inestable y no pudo ser desarrollada esta tarea
    No Operation