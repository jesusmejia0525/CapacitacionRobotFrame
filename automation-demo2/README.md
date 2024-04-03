# Demostración RPA

> Nota: Este proyecto, además de ser una demostración de RPA, es un proyecto de
> aprendizaje de Robot Framework.

Esta es una demostración de Automatización Robótica de Procesos (RPA) utilizando
Robot Framework. La demostración incluye las siguientes áreas de conocimiento:

- Robot Framework
- Automatización web
- Manejo de archivos de Excel (leer y escribir)

Las tareas de la demostración se encuentran en la carpeta `tasks`, y son las
siguientes:

1. Get Employee List
1. Get Employee
1. Add Employee
1. Add Multiple Employees
1. Get Employee Sub Unit Hierarchy Report
1. Get Employee Contact Info Report
1. Get Employee Job Details Report

El sistema que se utiliza para la demostración es
[OrangeHRM](https://opensource-demo.orangehrmlive.com/web/auth/login), un
sistema de gestión de recursos humanos. Las credenciales de acceso al sistema
son las siguientes:

- Usuario: admin
- Contraseña: admin123

## Pre-requisitos

- Python >3.9,<3.12
- Poetry

## Instalación de dependencias

1. Clone the repository
1. Create a virtual environment

   ```bash
   poetry env use python
   ```

1. Activate the virtual environment

   ```bash
   poetry shell
   ```

1. Install the dependencies

    ```bash
    poetry install
    ```

## Ejecución de las tareas

Use the following command to run the tasks in the employees suite:

```bash
poetry run robot -d reports tasks/employees.robot
```

To run a specific task, use the following command:

```bash
poetry run robot -d reports -t "Get Employee List" tasks/employees.robot
```