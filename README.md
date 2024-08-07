# Guía de Instalación y Configuración

Este documento proporciona instrucciones detalladas para configurar el entorno necesario para ejecutar el proyecto. Asegúrate de seguir cada paso cuidadosamente para garantizar que el sistema funcione correctamente.

## Requisitos

- **Java JDK 17**
- **Node.js**
- **npm**

## Pasos de Instalación

### 1. Instalar JDK 17

1. **Descarga** el JDK 17 desde el [sitio web oficial de Oracle](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html) o desde una distribución de tu preferencia.
2. **Instala** el JDK 17 siguiendo las instrucciones del instalador.
3. **Agregar al PATH** (si es necesario):
   - Abre el **Panel de Control**.
   - Navega a **Sistema y Seguridad** > **Sistema** > **Configuración avanzada del sistema**.
   - En la pestaña **Avanzado**, haz clic en **Variables de entorno**.
   - En **Variables del sistema**, selecciona **Path** y haz clic en **Editar**.
   - Agrega la ruta al directorio `bin` del JDK (por ejemplo, `C:\Program Files\Java\jdk-17\bin`).
   - Haz clic en **Aceptar** para guardar los cambios.

### 2. Instalar Node.js

1. **Descarga** Node.js desde el [sitio web oficial](https://nodejs.org/en/).
2. **Instala** Node.js siguiendo las instrucciones del instalador.
3. **Agregar al PATH** (si es necesario):
   - Node.js generalmente se agrega automáticamente al PATH durante la instalación. Si no es así, sigue el mismo procedimiento que para el JDK.

### 3. Instalar el Paquete npm `http-server`

1. Abre una **ventana de terminal** o **símbolo del sistema**.
2. Ejecuta el siguiente comando para instalar `http-server` globalmente:
   ```sh
   npm install -g http-server

### 4. Configurar el Script de Inicio

1. Presiona `Windows + R` para abrir el cuadro de diálogo **Ejecutar**.
2. Ingresa `shell:startup` y presiona **Enter** para abrir la carpeta de inicio.
3. Coloca el archivo `boot.vbs` en esta carpeta. Este script se ejecutará automáticamente al iniciar sesión, asegurando que el entorno necesario se configure cada vez que inicies sesión en Windows.

### 5. Configurar la Carpeta de Archivos

1. Crea una carpeta en el disco `C:` y asegúrate de que tenga el nombre **`ImageTools`**.
2. Coloca todos los archivos relacionados con el proyecto en esta carpeta. Asegúrate de que la estructura de carpetas y archivos dentro de **`ImageTools`** sea correcta y conforme a las necesidades del proyecto.
