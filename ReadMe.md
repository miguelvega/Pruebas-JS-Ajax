# Proceso
Para esta actividad, tomaremos como referencia el ultimo proyecto de Ajax.

En primera instancia se nos indica que coloquemos la gema de jasmine en nuestro archivo Gemfile, por lo cual agregamos la siguiente línea `gem 'jasmine' `, sin embargo la gema correcta es gem 'jasmine-rails', ya que con ello estariamos incorporando Jasmine como parte de nuestra aplicación Rails. Después de realizar ese paso, nos movemos al directorio raiz en la consola y procedemos a ejecutar el comando `bundle install`, cone ello podemmos utilizar correctamente el comando `rails generate jasmine_rails:install`, ya que este generador es proporcionado por la gema jasmine-rails, una vez hecho esto se muestra que el generador ha creado el archivo jasmine.yml en la ruta spec/javascripts/support/ , donde este archivo jasmine.yml suele contener la configuración de Jasmine para nuestra aplicación, tambien ha agregado una línea al archivo de rutas de nuestra aplicación en config/routes.rb. La línea añadida monta el motor de JasmineRails en la ruta /specs. Esta configuración sera necesaria para que podamos acceder a las páginas de Jasmine desde la aplicación Rails 

![Captura de pantalla de 2023-11-30 10-35-46](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/0820bd4f-a865-4587-bc35-1fdfb8bc1d3c)

Creamos el directorio fixture con el siguiente comando `mkdir spec/javascripts/fixtures`  y agregamos estos cambios en los archivos del directorio( spec/javascripts) para que esten listos para ser incluidos en el próximo commit con `git add spec/javascripts`.

No podemos ejecutar un conjunto de pruebas Jasmine completamente vacío, así que crea el fichero `spec/javascripts/basic_check_spec.js` con el siguiente código:

```javascript
describe ('Jasmine basic check', function() { 
    it('works', function() { expect(true).toBe(true); }); 
}); 

```
Ejecutamos nuestras pruebas en la terminal para realizar la comprobacion de que todo esta funcionando como lo esperado 

Luego, ejecutamos el comando bin/rails server desde nuestro directorio raiz para ejecutar las pruebas al dirigirnos a localhost:3000/specs 

### Pregunta: ¿Cuáles son los problemas que se tiene cuando se debe probar Ajax?. Explica tu respuesta.

Recordemos que las operaciones Ajax son asíncronas, por ello se requiere un manejo especial en las pruebas. Con lo cual las pruebas deben esperar a que las operaciones Ajax se completen antes de realizar afirmaciones sobre los resultados. Ademas las pruebas deben verificar que el DOM se actualice correctamente después de que se haya completado

### Pregunta: ¿Qué son los stubs, espias y fixture en Jasmine para realizar pruebas de Ajax?

. Stubs (conocido como simulaciones o reemplazos):  Los stubs son como actores de reemplazo en las pruebas. Imaginemos que tenemos una función que hace una llamada Ajax. En lugar de usar la función real durante las pruebas, empleamos un "doble" (stub) que simula la llamada Ajax y devuelve datos predefinidos. Esto nos da control sobre lo que la llamada debería producir, lo que nos permite  predecir la salida de la llamada Ajax en el entorno de prueba.

. Espiás: Los espiás son como observadores como su mismo nombre lo dice. En el contexto de pruebas de Ajax, podemos usar un espía para "observar" funciones que hacen llamadas Ajax. Esto significa que el espía registra cuándo y cómo se llaman estas funciones, así como qué argumentos se les pasan. Es útil para verificar si las operaciones Ajax se están ejecutando correctamente y con los datos esperados.

. Fixture: Un fixture es como un guion predefinido. En Jasmine y las pruebas de Ajax, un fixture es un conjunto de datos de prueba que simula la respuesta de una llamada Ajax. Imaginemos que necesitamos probar cómo la aplicación maneja la respuesta de un servidor. Utilizamos un fixture para simular esa respuesta, permitiéndote establecer condiciones predecibles para tus pruebas. Es como crear el escenario perfecto para nuestras pruebas, dándole condiciones controladas y predecibles. Combinando esto con stubs tenemos un control total en tus pruebas de Ajax.




