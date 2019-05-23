# Prueba técnica

El objetivo de la prueba es saber si eres capaz de crear una sencilla aplicación basada en dos vistas que muestra información de un servicio.

Debes hacer un `fork` del proyecto, desarrollar la prueba y mandar un `pull request`. 

Es un proyecto nuevo de Xcode con [CocoaPods](https://cocoapods.org/), por si quieres añadir algún Pod.
  
## ¿Cómo funciona la API?
La API es un proveedor de datos de prueba:

[https://jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com)

En ella hay usuarios (`User`) que escriben publicaciones (`Post`) y cada publicación (`Post`) tiene comentarios (`Comments`). Todo ello relacionado con `postId` y `userId` de forma muy intuitiva. 

Tal y como explica al final de la página, están todas las APIs de `GET` de listas y `GET` de elementos de cada uno de los tipos.

## ¿Qué se pide?
Utilizando la API, la aplicación debe tener los siguiente:
- La primera vista debe mostrar un listado de publicaciones (`Post`) utilizando el servicio, con mostrar el título y una línea del contenido es suficiente.
- La segunda vista se mostrará al pulsar sobre uno de las publicaciones (`Post`) y debe mostrar:
  - Título y contenido.
  - Información sobre el usuario (`User`), nombre, email y compañía (si te parece interesante algún dato más, adelante ;))
  - Una lista de comentarios (`Comment`) de la publicacioón (`Post`) (muestra los datos que te parezcan interesantes)

## ¿Qué es importante?
- Que funcione ;)
- Limpieza en el código
- Buen uso del AutoLayout
- Eficiencia

## ¿Qué es valorable?
- Orden en la estructura del proyecto
- Algunos comentarios
- Vistas bien ordenadas
- Peek and pop
