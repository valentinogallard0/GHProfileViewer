# GHProfileViewer

Una app desarrollada en SwiftUI que permite visualizar perfiles públicos de GitHub, incluyendo sus repositorios y seguidores.

## Funcionalidades

- Buscar usuarios por nombre
- Ver foto de perfil ampliada
- Listar seguidores en un sheet
- Mostrar los primeros repositorios y acceder a la lista completa
- Persistencia del último usuario que se busco
- Manejo de errores y estados de carga

## Tecnologías

- SwiftUI
- MVVM
- URLSession
- Codable
- UserDefaults

## Decisiones Tecnicas
- Arquitectura MVVM
- Uso de URLsessions
- Uso de Codable
- Separacion en carpetas

## Instrucciones de instalacion

Requisitos que necesitamos:
- macOS con Xcode instalado
- Cuenta de GitHub (para clonar el repositorio)
- Conexión a internet

1. Crea una carpeta 
2. Clona el repositorio en esa carpeta utilizando el comando de git clone https://github.com/valentinogallard0/GHProfileViewer.git
3. Abre el proyecto en xcode 
4. Ejecuta en el simulador o dispositivo presionando el boton de run. 

## Challenges enfrentados
Este reto la verdad es que me costo bastante al principio. Me tocó trabajar con cosas que nunca había usado antes, como consumir APIs, guardar datos con UserDefaults, y aplicar la arquitectura MVVM. Todo eso fue lo más complicado de implementar, y siento que gran parte del reto giró en torno a entender y hacer funcionar esa lógica.
Ya cuando pasé a la parte visual, donde empecé a usar SwiftUI y cosas que ya conocía, todo se volvió más manejable. Ahí fue cuando empecé a disfrutar más el proceso y a sentir que tenía el control.
A pesar de todas las dificultades, me gustó mucho el reto. Aprendí un montón, resolví errores que me hicieron pensar e investigar.  Me quedo con la experiencia y con ganas de seguir aprendiendo.


## Mejoras futuras

- El diseño de la pagina principal

