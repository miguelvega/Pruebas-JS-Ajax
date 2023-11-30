# Proceso
Para esta actividad, tomaremos como referencia el ultimo proyecto de Ajax.

En primera instancia se nos indica que coloquemos la gema de jasmine en nuestro archivo Gemfile, por lo cual agregamos la siguiente línea `gem 'jasmine' `, sin embargo la gema correcta es gem 'jasmine-rails', ya que con ello estariamos incorporando Jasmine como parte de nuestra aplicación Rails. Después de realizar ese paso, nos movemos al directorio raiz en la consola y procedemos a ejecutar el comando `bundle install`, cone ello podemmos utilizar correctamente el comando `rails generate jasmine_rails:install`, ya que este generador es proporcionado por la gema jasmine-rails, una vez hecho esto se muestra que el generador ha creado el archivo jasmine.yml en la ruta spec/javascripts/support/ , donde este archivo jasmine.yml suele contener la configuración de Jasmine para nuestra aplicación, tambien ha agregado una línea al archivo de rutas de nuestra aplicación en config/routes.rb. La línea añadida monta el motor de JasmineRails en la ruta /specs. Esta configuración sera necesaria para que podamos acceder a las páginas de Jasmine desde la aplicación Rails 

![Captura de pantalla de 2023-11-30 10-35-46](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/0820bd4f-a865-4587-bc35-1fdfb8bc1d3c)
