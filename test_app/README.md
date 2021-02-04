# test_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Información de la aplicación. 

En el proyecto use BLoC Pattern, en donde tengo separada la lógica de la aplicación de la parte visual, así como la parte de manejo de datos, uso los BlocListener, BlocBuilder para generar vistas, los repositories (userRepository) para gestionar los datos, tanto si hay conexión o no hubo conexión, las respuestas de las peticiones se serializan en objetos para su manupulación en vistas o en los Bloc, para la parte de los modelos uso json_serializable. Para regenerar un modelo anexo un readme en la seccion de modelos y payloads.  

El proyecto lo estuve probando en iOS, la configuración de Android no se modifico, está como cuando se crea el proyecto por default. 

El login está completo para probar. 

Se puede visualizar la informaicón del usuario, así como está el input de texto para buscar y el botón para "buscar", sin embargo el servicio tuve complicaciones, ya que no logré que me devolviera información correcta, pero lo volveré a intentar para tratar de mostrar las transacciones. 

El token de almacena como información persistente (no en base de datos) para validar si existe una sesión iniciada o si es necesario hacer login redirige hacia el perfil de manera directa. 

Cundo se obtiene la información del usuario, lo cual se hace en la sección de Perfil, cuando la petición hacia el servidor es exitosa, la información del usuario se almacena en una base de datos de SQLite, la cual solo cuenta con una tabla (user), en caso de que no haya conexión o que el servidor falle o por alguna razón no se logre obtener la información el repositorio (UserRepository) identifica que hubo un problema de conexión y va a buscar la información del usuario que está en la base de datos de SQLite y lo devuelve hacia la vista para presentar la información. 

Me gustaría intentar hacer la parte de loyalty y tratar de listar la cartelera. 

Si hay alguna duda del proyecto estoy al pendiente. 


 