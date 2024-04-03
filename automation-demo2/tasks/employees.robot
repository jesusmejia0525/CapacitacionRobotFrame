*** Settings ***
Library    SeleniumLibrary
# Resource    ${CURDIR}/../resources/page_objects/login.resource
Resource    ${CURDIR}/../resources/page_objects/pim/navigation.resource
Resource    ${CURDIR}/../resources/page_objects/top_app_bar.resource
# Resource    ${CURDIR}/../resources/page_objects/pim/navigation.resource
Resource    ${CURDIR}/../resources/page_objects/pim/employee_list.resource
Resource    ${CURDIR}/../resources/page_objects/pim/add_employee.resource
Resource    ${CURDIR}/../resources/page_objects/pim/reports.resource
Resource    ${CURDIR}/../resources/shared/excel.resource
Resource    ${CURDIR}/../resources/shared/setup_teardown.resource
Resource    ${CURDIR}/../resources/page_objects/login.resource
Resource    ${CURDIR}/../resources/page_objects/navigation.resource
Suite Setup    Open navigator
Suite Teardown    Close navigator

*** Variables ***
#------Datps Inicio Sesion----#
${username}=    Admin
${password}=    admin123
#---Menu Lateral---#
${navbar_option}    PIM
#---Datos Busqueda Empleado----#
${nombre_emp}=    12344
${id_emp}=
${estatus_emp}=    Freelance
${Filtro_emp}=
${nombre_super}=
${titulo_puesto}=
${sub_unit}=
#---Menu Superior PIM---#
${navbarPim_opcion}=    Reports
#------datos Agregar empleado-----#
${nombre}=    Paco
${apellidoP}=    Pedro
${apellidoM}=    Lopez
${id}=    485

*** Tasks ***
# login
#     Iniciar Sesion    ${username}    ${password}
#     Navegar A    ${navbar_option}

# Navbar text Should be 
#     Texto debe ser    ${navbar_option}
    
# Get Employee List
#     Leer datos de Empleados

#Get Employee
   # Buscar Empleado    ${nombre_emp}    ${id_emp}    ${estatus_emp}    ${Filtro_emp}    ${nombre_super}    ${titulo_puesto}    ${sub_unit}

# Add Employee
#     Navegar a PIM modulos    ${navbarPim_opcion}
#     Agregar Empleado    ${nombre}    ${apellidoP}    ${apellidoM}    ${id}

# Add Multiple Employees
#     ${dataExcel}=    Read Data From Excel File    ${CURDIR}/../data/empleados.xlsx
#     Agregar Empleaodos Excel    ${dataExcel}

Get Employee List
    [Documentation]
    ...    Get the list of employees from the Employee List page in the PIM module
    [Tags]    get-list
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Leer datos de Empleados


Get Employee
    [Documentation]
    ...    Get the details of an employee from the Employee List page in the PIM module
    [Tags]    get
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Buscar Empleado     ${nombre_emp}    ${id_emp}    ${estatus_emp}    ${Filtro_emp}    ${nombre_super}    ${titulo_puesto}    ${sub_unit}

Add Employee
    [Documentation]
    ...    Add a new employee from the Add Employee page in the PIM module
    [Tags]    add
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Navegar a PIM modulos    Add Employee
    Agregar Empleado    ${nombre}    ${apellidoP}    ${apellidoM}    ${id}


Add Multiple Employees
    [Documentation]
    ...    Add multiple employees from the Add Employee page in the PIM module
    [Tags]    add-multiple
    Iniciar Sesion    ${username}    ${password}
    Navegar A    PIM
    Texto debe ser    PIM
    Navegar a PIM modulos    Add Employee
    ${dataExcel}=    Read Data From Excel File    ${CURDIR}/../data/empleados.xlsx
    Agregar Empleaodos Excel    ${dataExcel}

Get Employee Sub Unit Hierarchy Report
    [Documentation]
    ...    Get the sub unit hierarchy of employees from the Reports page in the PIM module
    [Tags]    get-report-sub-unit
    No Operation

Get Employee Contact Info Report
    [Documentation]
    ...    Get the contact information of employees from the Reports page in the PIM module
    [Tags]    get-report-contact-info
    Navegar a PIM modulos    Report
    ${tablas}=    Reporte contacto
    Write Data To Excel File    ${tablas}    ${OUTPUT_DIR}/ReporteContacto.xlsx

Get Employee Job Details Report
    [Documentation]
    ...    Get the job details of employees from the Reports page in the PIM module
    [Tags]    get-report-job-details
    No Operation