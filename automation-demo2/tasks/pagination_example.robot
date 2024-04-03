*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Tasks ***
Manejar Paginacion
    # Crear arreglo de datos
    ${datos}=    Create List
    # Obtener WebElements de la paginación (botones de páginas)
    ${paginas}=    Get WebElements    //button[contains(@class, 'oxd-pagination-page-item--page')]
    # Iterar sobre la lista
    FOR    ${pagina}    IN    @{paginas}
        # Dar click en el botón de la página
        Click Element    ${pagina}
        # TODO: Obtener datos de la página actual de la tabla
        # ${datos_pagina}=    ...
        # TODO: Crear diccionario con los datos de la página
        # Ejemplo: {'first_name': 'Juan', 'last_name': 'Vertiz'}
        # Agregar datos a la lista
        Append To List    ${datos}    ${datos_pagina}
    END
    # TODO: Crear archivo Excel con los datos
    # NOTA: La estructura de datos debe ser como sigue:
    # [
    #     {'first_name': 'Juan', 'last_name': 'Vertiz'},
    #     {'first_name': 'Jesús', 'last_name': 'Mejia'},
    # ]