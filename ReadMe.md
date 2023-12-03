# Proceso y Respuestas
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
Ejecutamos nuestras pruebas en la terminal, para realizar la comprobacion de que todo esta funcionando como lo esperado, basicamente la prueba en el archivo spec/javascripts/basic_check_spec.js verifica que la expresión true es, de hecho, verdadera, entonces la prueba pasara; de lo contrario, si colocamos otro valor por ejemplo, false,  se informarán que la prueba fallo.


![Captura de pantalla de 2023-12-01 17-58-06](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/07763b2c-3960-497f-a130-c0191385e436)

Agregamos `//= link boot0.js` en `manifest.js` para ver las pruebas en localhost:3000/specs al ejecutar en nuestro directorio raiz rails server, con lo cual se muestra lo siguiente: 


![Captura de pantalla de 2023-12-01 22-07-23](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/2bd7aa9e-f847-4653-8844-a367655be510)

Como podemos apreciar, si bien la salida nos dice que se cargo correctamete la aplicación, sin embargo no se cargan todos los datos.

Por tal motivo,  como alternatica realizamos lo siguientes pasos : 

Usamos Jasmine for Browsers <br>

Agregue Jasmine a su paquete.json <br> 

`npm install --save-dev jasmine-browser-runner jasmine-core`

Inicializa Jasmine en tu proyecto <br> 

`npx jasmine-browser-runner init`

Configure Jasmine como su script de prueba en su paquete.json 

```
{
  "scripts": {
    "test": "jasmine-browser-runner runSpecs"
  }
}



``` 

Ejecute sus pruebas <br>

`npm test`

Y nos muestra las pruebas en el navegador : 


![Captura de pantalla de 2023-12-01 23-25-20](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/9d017002-f958-4a88-b40f-fe9d155c1f53)


### Pregunta: ¿Cuáles son los problemas que se tiene cuando se debe probar Ajax?. Explica tu respuesta.

Recordemos que las operaciones Ajax son asíncronas, por ello se requiere un manejo especial en las pruebas. Con lo cual las pruebas deben esperar a que las operaciones Ajax se completen antes de realizar afirmaciones sobre los resultados. Ademas las pruebas deben verificar que el DOM se actualice correctamente después de que se haya completado

### Pregunta: ¿Qué son los stubs, espias y fixture en Jasmine para realizar pruebas de Ajax?

. Stubs (conocido como simulaciones o reemplazos):  Los stubs son como actores de reemplazo en las pruebas. Imaginemos que tenemos una función que hace una llamada Ajax. En lugar de usar la función real durante las pruebas, empleamos un "doble" (stub) que simula la llamada Ajax y devuelve datos predefinidos. Esto nos da control sobre lo que la llamada debería producir, lo que nos permite  predecir la salida de la llamada Ajax en el entorno de prueba.

. Espiás: Los espiás son como observadores como su mismo nombre lo dice. En el contexto de pruebas de Ajax, podemos usar un espía para "observar" funciones que hacen llamadas Ajax. Esto significa que el espía registra cuándo y cómo se llaman estas funciones, así como qué argumentos se les pasan. Es útil para verificar si las operaciones Ajax se están ejecutando correctamente y con los datos esperados.

. Fixture: Un fixture es como un guion predefinido. En Jasmine y las pruebas de Ajax, un fixture es un conjunto de datos de prueba que simula la respuesta de una llamada Ajax. Imaginemos que necesitamos probar cómo la aplicación maneja la respuesta de un servidor. Utilizamos un fixture para simular esa respuesta, permitiéndote establecer condiciones predecibles para tus pruebas. Es como crear el escenario perfecto para nuestras pruebas, dándole condiciones controladas y predecibles. Combinando esto con stubs tenemos un control total en tus pruebas de Ajax.


La estructura básica de los casos de prueba de Jasmine se hace evidente en el código siguiente como en RSpec, Jasmine utiliza `it` para especificar un único ejemplo y bloques `describe` anidados para agrupar conjuntos de ejemplos relacionados. Tal y como ocurre en RSpec, `describe` e `it` reciben un bloque de código como argumento, pero mientras que en Ruby los bloques de código están delimitados por `do. . . end`, en JavaScript son funciones anónimas (funciones sin nombre) sin argumentos.

La secuencia de puntuación }); prevalece porque `describe` e `it` son funciones JavaScript de dos argumentos, el segundo de los cuales es una función sin argumentos.

### Pregunta: Experimenta el siguiente código de especificaciones (specs) de Jasmine del camino feliz del código AJAX llamado movie_popup_spec.js
```javascript
describe('MoviePopup', function() {
  describe('setup', function() {
    it('adds popup Div to main page', function() {
      expect($('#movieInfo')).toExist();
    });
    it('hides the popup Div', function() {
      expect($('#movieInfo')).toBeHidden();
    });
  });
  describe('clicking on movie link', function() {
    beforeEach(function() { loadFixtures('movie_row.html'); });
    it('calls correct URL', function() {
      spyOn($, 'ajax');
      $('#movies a').trigger('click');
      expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/movies/1');
    });
    describe('when successful server call', function() {
      beforeEach(function() {
        let htmlResponse = readFixtures('movie_info.html');
        spyOn($, 'ajax').and.callFake(function(ajaxArgs) { 
          ajaxArgs.success(htmlResponse, '200');
        });
        $('#movies a').trigger('click');
      });
      it('makes #movieInfo visible', function() {
        expect($('#movieInfo')).toBeVisible();
      });
      it('places movie title in #movieInfo', function() {
        expect($('#movieInfo').text()).toContain('Casablanca');
      });
    });
  });
});
```

![Captura de pantalla de 2023-12-02 23-43-13](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/e9351868-125d-457e-9b9f-69aed156879b)

Este error suele ocurrir cuando jQuery no se ha cargado correctamente antes de que se ejecuten las pruebas, esto debido a que "ReferenceError: $ is not defined" indica que en el momento en que Jasmine está ejecutando las pruebas, la biblioteca jQuery ($) no está disponible.

### Pregunta ¿Que hacen las líneas del código anterior?.

El codigo anterior inicia un bloque de pruebas relacionado con el componente MoviePopup, ademas todas las pruebas dentro de este bloque se centraran en este componente específico. Ahora, vamos a analizar el bloque `escribe('setup', function() {...}`, este bloque  organiza pruebas relacionadas con la configuración inicial del componente MoviePopup. Cada prueba dentro de este bloque se centra en aspectos específicos de la configuración inicial y verifica si el componente se encuentra en el estado deseado después de la configuración. El siguiente bloque `describe('clicking on movie link', function() {}`verifica que al hacer clic en un enlace de películas, se realiza una llamada Ajax a la URL '/movies/1'. Se utiliza spyOn para rastrear las llamadas a la función ajax y garantizar que se realice correctamente con la URL específica. Ademas con la linea `beforeEach(function() { loadFixtures('movie_row.html'); });` se carga un conjunto de datos de prueba (movie_row.html) antes de entrar a la prueba (it) dentro del bloque.Finalmente el bloque de prueba `describe('when successful server call', function() {...}:` simula una llamada exitosa al servidor cuando se hace clic en un enlace de película. Luego, verifica que como resultado de esta llamada, el elemento con id 'movieInfo' se vuelve visible y contiene el título de la película 'Casablanca'.

### ¿Cuál es el papel de spyOn de Jasmine y los stubs en el código dado?.

Podemos apreciar algunas partes donde se observa la funcionalidad de spyOn de Jasmine y los stubs, por ejemplo en `spyOn($, 'ajax').and.callFake(function(ajaxArgs) { ajaxArgs.success(htmlResponse, '200');});` se utiliza spyOn para espiar el método $.ajax, y and.callFake se utiliza para establecer un comportamiento falso (un stub) para el método espíado. En este caso, cuando se llama a `$.ajax` en lugar de realizar una solicitud real al servidor, se llama a la función falsa proporcionada en and.callFake, que simula una respuesta exitosa del servidor.


### Pregunta ¿Que hacen las siguientes líneas del código anterior?. ¿Cuál es el papel de spyOn de Jasmine y los stubs en el código dado?.

```javascript
it('calls correct URL', function() {
      spyOn($, 'ajax');
      $('#movies a').trigger('click');
      expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/movies/1');
    });
```
La línea de código `it('calls correct URL', function() {...}` define un ejemplo específico de prueba dentro de un bloque describe en Jasmine para corroborar que la prueba verifique que se realice una llamada a la URL correcta.
la linea `spyOn($, 'ajax');` se utiliza  para crear un espía en la función ajax de jQuery  para rastrear llamadas a una función y observar su comportamiento durante las pruebas.
La siguiente linea `$('#movies a').trigger('click');` simula la acción del usuario al hacer clic en un enlace de películas, lo que debería activar una llamada Ajax.
Finalemente, `expect($.ajax.calls.mostRecent().args[0]['url']).toEqual('/movies/1');`  usa la funcionalidad del espía creado por spyOn para realizar una afirmación. Verifica que la última llamada a la función ajax se haya hecho con la URL esperada ('/movies/1'). Con ello simulamos que el clic en el enlace de películas haya realizado una llamada Ajax con la URL correcta, con el fin de verificar que la lógica relacionada con Ajax se está ejecutando correctamente. 


### Pregunta:¿Qupe hacen las siguientes líneas del código anterior?.

```javascript

 let htmlResponse = readFixtures('movie_info.html');
        spyOn($, 'ajax').and.callFake(function(ajaxArgs) { 
          ajaxArgs.success(htmlResponse, '200');
        });
        $('#movies a').trigger('click');
      });
      it('makes #movieInfo visible', function() {
        expect($('#movieInfo')).toBeVisible();
      });
      it('places movie title in #movieInfo', function() {
        expect($('#movieInfo').text()).toContain('Casablanca');

```

Primero se utiliza readFixtures para cargar el contenido del archivo 'movie_info.html' y almacenarlo en la variable htmlResponse.
Despues, se utiliza `spyOn` para espiar la función `$.ajax` y luego se emplea `and.callFake` para proporcionar una implementación falsa de la función espiada. En este caso, se reemplaza la función $.ajax con una función falsa que simula una respuesta exitosa del servidor `(ajaxArgs.success(htmlResponse, '200'))`. En `$('#movies a').trigger('click');` se simula la interacción del usuario al hacer clic en un enlace que esta dentro del elemento con el id movies que desencadenaría una llamada AJAX. Luego, se realiza las pruebas de Visibilidad y Contenido, donde en la primera prueba se verifica que el elemento con el id 'movieInfo' sea visible después de la llamada AJAX simulada. En la segunda prueba, verifica que el texto dentro del elemento con el id movieInfo contiene la cadena 'Casablanca', lo que indica que la información de la película se colocó correctamente en el contenedor después de la llamada AJAX simulada.

### Pregunta: Dado que Jasmine carga todos los ficheros JavaScript antes de ejecutar ningún ejemplo, la llamada a setup (línea 34 del codigo siguiente llamado movie_popup.js)ocurre antes de que se ejecuten nuestras pruebas, comprueba que dicha función hace su trabajo y muestra los resultados.

```javascript

var MoviePopup = {
  setup: function() {
    // add hidden 'div' to end of page to display popup:
    let popupDiv = $('<div id="movieInfo"></div>');
    popupDiv.hide().appendTo($('body'));
    $(document).on('click', '#movies a', MoviePopup.getMovieInfo);
  }
  ,getMovieInfo: function() {
    $.ajax({type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: MoviePopup.showMovieInfo,
            error: function(xhrObj, textStatus, exception) { alert('Error!'); }
            // 'success' and 'error' functions will be passed 3 args
           });
    return(false);
  }
  ,showMovieInfo: function(data, requestStatus, xhrObject) {
    // center a floater 1/2 as wide and 1/4 as tall as screen
    let oneFourth = Math.ceil($(window).width() / 4);
    $('#movieInfo').
      css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
      html(data).
      show();
    // make the Close link in the hidden element work
    $('#closeLink').click(MoviePopup.hideMovieInfo);
    return(false);  // prevent default link action
  }
  ,hideMovieInfo: function() {
    $('#movieInfo').hide();
    return(false);
  }
};
$(MoviePopup.setup);


```
La funcion setup en el archivo movie_popup.js  hace que se cree un elemento div con el id 'movieInfo' y se oculta inicialmente, este elemento se agrega al final del cuerpo 
del documento, tambien configura un evento de clic para los enlaces (<a>) dentro de los elementos con el id 'movies', de tal manera que cuando se hace clic en uno de estos enlaces, se llama a la función MoviePopup.getMovieInfo. Por consiguiente, Las líneas 2 a 9 en movie_popup_spec.js verifican si la función MoviePopup.setup configura correctamente el div flotante que se utilizará para mostrar la información de la película. Las líneas 10 a 32 verifican el comportamiento del código AJAX sin llamar realmente al servidor RottenPotatoes evitando la llamada AJAX.

![Captura de pantalla de 2023-12-03 04-10-58](https://github.com/miguelvega/Pruebas-JS-Ajax/assets/124398378/040b39f1-aaf4-4dc7-89af-9d91aa062605)




### Pregunta: Indica cuales son los stubs y fixtures disponibles en Jasmine y Jasmine-jQuery.

En Jasmine, el término "stubs" a menudo se utiliza en el contexto de mocks (simulacros). Un "stub" es una función simulada que reemplaza una función real durante las pruebas. Jasmine proporciona funciones como jasmine.createSpy para crear mocks y realizar afirmaciones sobre cómo se llaman y qué valores devuelven.

En el contexto de Jasmine-jQuery, las "fixtures" son fragmentos de código HTML que se cargan en el DOM durante las pruebas para simular la presencia de elementos HTML específicos. Jasmine-jQuery proporciona funciones como loadFixtures para cargar archivos HTML y readFixtures para acceder al contenido de esos archivos.

En resumen, Jasmine proporciona "stubs" a través de mocks para reemplazar funciones reales, y Jasmine-jQuery proporciona "fixtures" para cargar fragmentos HTML en el DOM durante las pruebas.

### Pregunta: Como en RSpec, Jasmine permite ejecutar código de inicialización y desmantelamiento de pruebas utilizando beforeEach y afterEach. El código de inicialización carga el fixture HTML mostrado en el código siguiente, para imitar el entorno que el manejador getMovieInfo vería si fuera llamado después de mostrar la lista de películas.

```
<div id="movies">
  <div class="row">
    <div class="col-8"><a href="/movies/1">Casablanca</a></div>
    <div class="col-2">PG</div>
    <div class="col-2">1943-01-23</div>
  </div>
</div>

```
En Jasmine, beforeEach y afterEach permiten ejecutar código de inicialización y desmantelamiento antes y después de cada prueba, respectivamente.


