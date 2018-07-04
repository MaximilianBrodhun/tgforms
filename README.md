# tgForms

> Generate HTML forms from Turtle RDF representations

tgForms is a JavaScript library to generate HTML forms from Turtle RDF representations. It was originally written for the use with [TextGrid](http://textgrid.de).

## Installation


If you have [node.js](http://nodejs.org) and [Bower](http://bower.io) installed, you can get the latest development version of tgForms with the following command:

```sh
$ bower install hriebl/tgForms
```

If you want to download a specific pre-compiled version of tgForms, just append the version number to the command, e.g.:

```sh
$ bower install hriebl/tgForms#0.1
```

## Compilation

Compiling tgForms is easy if you have [CoffeeScript](http://coffeescript.org) and [Cake](http://coffeescript.org/documentation/docs/cake.html) installed. In the tgForms directory, execute:

```sh
$ cake build
```

You may also minify the compiled JS file by running these commands:

```sh
$ wget "http://dl.google.com/closure-compiler/compiler-latest.zip"
$ unzip -nx "compiler-latest.zip"
$ cake minify
```

## Turtle

First, you need to define a form in a Turtle file. [See an example here.](https://github.com/hriebl/bolPerson/blob/master/src/main/webapp/bolPerson.ttl)

These are the classes of tgForms:

### form

> A form. Properties may belong to forms, see the belongsToForm property.

### input

> An input possibility. Properties may have inputs, see the hasInput property.

&nbsp;

The input class has the following instances:

### button

> A button. May be manually scripted, useful for specific input possibilities.

### checkbox

> A checkbox. Useful for true or false options.

### dropdown

> A dropbox menu. Useful if there is a closed set of possible values.

### text

> A text field. Useful for short texts.

### textarea

> A text area. Useful to longer texts.

&nbsp;

tgForms also comes with some properties:

### belongsToForm

> Links a property to a form.

### hasInput

> Links a property to a instance of input.

### hasDefault

> Sets a default value value for a property.

### hasOption

> Sets an option for a property. May only be used with the dropdown class.

### hasPriority

> Sets an priority for a property. Properties with higher priorities appear before properties with lower priorities.

### isRepeatable

> Makes a property repeatable.

### represents

> Links a form to another RDFS class.

## JavaScript

Now, you can work with your Turtle file using the JS library. [See an example here.](https://github.com/hriebl/bolPerson/blob/master/src/main/webapp/bolPerson.coffee)

The tgForms class offers the following public methods:

### addTurtle(*turtle*, *addCall*)

Adds turtle data to the triple store and executes a callback afterwards. *turtle* is a string representing turtle data, *addCall* is a function.

### buildForm(*subject*, *selector*)

Builds a form into a DOM object. *subject* is a string representing an instance of form, *selector* is a string representing a CSS selector.

### getFormURI(*subject*)

Returns a form URI. *subject* is a string representing a form subject.

### getInput(*subject*, *type*, *selector*)

Returns a JSON-LD representation of a form input. *subject* is a string representing a form subject, *type* is a string representing the RDF type of subject, *selector* is a string representing a CSS selector for a DOM object containing a form.

### getPrefixes()

Returns the prefixes of the triple store as a JS object.

### getTypeURI(*subject*)

Returns a type URI. *subject* is a string representing a form subject.

### fillForm(*subject*, *selector*)

Fills a form. *subject* is a string representing a form subject, *selector* is a string representing a CSS selector for a DOM object containing a form.
