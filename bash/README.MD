<div align="center">
  
  # 🌸 Actividad de Scripts en Bash 🌸
  
  *Colección de 50 scripts en Bash, comentados y estructurados: de lo secuencial a las primeras condiciones.*

  ![Bash](https://img.shields.io/badge/Bash-Scripting-FFB6C1?style=for-the-badge&logo=gnu-bash&logoColor=white)
  ![Linux](https://img.shields.io/badge/Linux-Terminal-F4C2C2?style=for-the-badge&logo=linux&logoColor=white)
  ![Progreso](https://img.shields.io/badge/Progreso-50%20%2F%20100-FFC0CB?style=for-the-badge)

</div>

---

## 🎀 Sobre este proyecto

Este repositorio contiene la solución a una actividad práctica de **scripts en Bash**. Ya están terminados los **50 primeros ejercicios** (`ej001.sh` a `ej050.sh`). Todos se han desarrollado siguiendo las buenas prácticas de programación en terminal.

Se cumplen estrictamente los siguientes criterios de evaluación:
- 📝 **Código documentado:** Cada script incluye comentarios explicativos detallando el uso de variables, comandos clave y redirecciones.
- 📏 **Estructura limpia:** Código correctamente espaciado, indentado (cuando aplica) y muy fácil de leer.
- ✨ **Listos para usar:** Todos los archivos incluyen la cabecera `#!/bin/bash`.
- 🛡️ **Entradas controladas:** Los scripts que reciben parámetros o datos del usuario comprueban que son válidos antes de usarlos (a partir del ejercicio 41).

---

## 🌷 Resumen de contenidos

La actividad se divide en diferentes bloques de aprendizaje:

*   **Básicos y Entorno (01 - 09):** Saludos, variables simples, uso de `whoami`, `date`, `pwd`, creación de directorios y calculadoras matemáticas secuenciales.
*   **Gestión de Ficheros (10 - 15):** Copia, movimiento, permisos, lecturas de principio/fin de archivos (`head`/`tail`), uso de comandos como `which` o `file` y redirección de la salida estándar y de errores.
*   **Avanzados y Sistema (16 - 19):** Variables especiales de bash (`$$`, `$0`, `$#`), parámetros en orden inverso, monitorización de RAM/Disco y creación de enlaces duros y simbólicos.
*   **Procesamiento de Texto (20 - 30):** Lectura de datos con `read`, extracción de campos con `cut` y `awk`, conteos con `wc`, filtros con `grep`, duplicados con `sort`/`uniq`, transformaciones con `tr` y `sed`, el UID más alto de `/etc/passwd`, los procesos que más memoria usan y recuento de ficheros y directorios.
*   **Pipes y Sistema (31 - 40):** IP del equipo (`ip a`, `hostname -I`), troceado de la fecha, los 5 elementos más pesados con `du`, líneas concretas con `head`/`tail` y `sed -n`, conteo de vocales, informes con `tee`, sumas con `awk`, búsqueda y conteo de palabras, procesos del usuario con `ps` y shells usadas en el sistema.
*   **Condicionales (41 - 50):** Estructuras `if`/`elif`/`else`: número positivo o negativo, par o impar, comprobaciones de ficheros (`-e`, `-f`, `-d`) y permisos (`-r`, `-w`, `-x`), el mayor de dos números, validación de parámetros con `$#`, existencia de un usuario, calificaciones por tramos y comparación de cadenas (`-z`, `=`).

---

## 💖 Cómo ejecutar los scripts

1. **Clona este repositorio** en tu equipo local:
   ```bash
   git clone https://github.com/norahnordlander/addscripts.git
   ```

2. **Accede a la carpeta** de los scripts:
   ```bash
   cd addscripts/bash
   ```

3. **Da permisos de ejecución** a los scripts (solo la primera vez):
   ```bash
   chmod +x ej*.sh
   ```

4. **Ejecuta cualquier script**:
   ```bash
   ./ej001.sh
   ```
   *(Algunos scripts reciben parámetros, por ejemplo `./ej017.sh uno dos` o `./ej045.sh fichero.txt`. Los del bloque de condicionales te muestran cómo se usan si los ejecutas sin ellos.)*

---

<div align="center">
  <p>Hecho con 🩷 y mucha dedicación.</p>
</div>
