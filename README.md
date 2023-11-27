# Compiladores Semana 7: Un pequeño compilador

Por: **Frannie Fermin** \
Matrícula: **1-16-0408**


## Introducción
Este pequeño compilador es una herramienta que facilita la visualizacion de algunas de las fases de un compilador y generando un código intermedio en SVG a partir de un codigo fuente que fue creado por el mismo desarrollador. 

## Como lo ejecuto?
Se pueden descargar el archivo llamado [Frannie Fermin 1-16-0408 Ejecutable.zip](https://github.com/SpazzPy/compiladores_semana_7/blob/main/Frannie%20Fermin%201-16-0408%20Ejecutable.zip) o presionarlo para redirigirse hacie el .zip con el ejecutable. \
Una vez descargado, sin descomprimirlo pueden ejecutar el .exe

## Como funciona el lenguaje?

Hay una serie de variables con parametros, las cuales pueden ser obviadas y se les asignaran valores por defectos. 

### Paper
**Descripcion**: Se requiere de primero para poder ver las demas figuras \
\
**Parámetros**: ancho, alto, color \
**Ejemplo de uso:** ```paper 300 300 cyan```


### rect (rectángulo)
**Descripcion**: Para dibujar un rectángulo \
\
**Parámetros**: posición x, posición y, ancho, alto, color \
**Ejemplo de uso:** ```rect 10 10 50 50 grey```

### circle (círculo)
**Descripcion**: Para dibujar un circulo \
\
**Parámetros**: posición x, posición y, radio, color \
**Ejemplo de uso:** ```circle 290 10 60 green```

### ellipse (elipse)
**Descripcion**: Se requiere de primero para poder ver las demas figuras \
\
**Parámetros**: posición x, posición y, radio x, radio y, color \
**Ejemplo de uso:** ```ellipse 10 290 120 30 red```

### line (línea)
**Descripcion**: Se requiere de primero para poder ver las demas figuras \
\
**Parámetros**: posición inicial x, posición inicial y, posición final x, posición final y, grosor, color \
**Ejemplo de uso:** ```line 150 150 300 300 10 blackn```

### Resultado:
![image](https://github.com/SpazzPy/compiladores_semana_7/assets/91347861/451365b5-62cf-4545-9fc2-80563fd9b3d4)

### Código utilizado en el ejemplo
```
paper 300 300 cyan
rect 10 10 50 50 grey
circle 290 10 60 green
ellipse 10 290 120 30 red
line 150 150 300 300 10 black
```


