---
title: javascript
date: 2020-08-30
---

# Javascript cheat sheet

To change stuff inside the page you can use `document.getElementById("name")` for example:

### innerHTML

Change the HTML of an item

``` html
<!DOCTYPE html>
<html>
<body>

<h2 id="Title"> What Can Javascript Do For You?</h2>
<p id="Text"> If that is the question press the button</p>

<button type="button" onclick='document.getElementById("Text").innerHTML = "It can make pages dynamic"'>
    Click me to find out!
</button>
</body>
</html>

```

### src

Change the source of an `img`

``` html
<!DOCTYPE html>
<html>
<body>

<h2 id="Title"> What Can Javascript Do For You?</h2>

<p>In this case JavaScript changes the value of the src (source) attribute of an image.</p>

<button onclick="document.getElementById('myImage').src='pic_bulbon.gif'">Turn on the light</button>

<img id="myImage" src="pic_bulboff.gif" style="width:100px">

<button onclick="document.getElementById('myImage').src='pic_bulboff.gif'">Turn off the light</button>

</body>
</html>

```

### style

Change the CSS of a HTML element.

```html
<!DOCTYPE html>
<html>
<body>

<h2>What Can JavaScript Do?</h2>

<p id="demo">JavaScript can change the style of an HTML element.</p>

<button type="button"
		onclick="Big();Red();">
        Click Me!
</button>

 <script>
 	function Big() {
   		document.getElementById('demo').style.fontSize='35px';
    }
    
    function Red(){
    	document.getElementById('demo').style.color='red';
    }
</script>

</body>
</html> 
```

### style.display

Hide elements on the screen: 

```javascript
 document.getElementById("demo").style.display = "none"; 
```

Or show them

```javascript
 document.getElementById("demo").style.display = "block"; 
```



## Scripts

- `function` can be placed in the `<body>` or `<head>` or both;

### From external documents

in a separate file called `myScript.js` we save :

```javascript
function myFunction() {
  document.getElementById("demo").innerHTML = "Paragraph changed.";
}
```

then in our html we pre-load it by writing

```html
<script src="myScript.js"></script>
```

#### Note

External scripts cannot contain `<script>` tags.



## Output

Javascript can write into 

| Location                 | Command                                 |
| ------------------------ | --------------------------------------- |
| into a HTML element      | `document.getElementByID("").innerHTML` |
| into the HTML output     | `document.write("")`                    |
| into an alert box        | `window.alert("")`                      |
| into the browser console | `console.log("")`                       |

#### note

- `document.write()` will delete everythin in the html document and replace it.

- You can skip the `window` keyword.

  In JavaScript, the window object is the global scope object, that  means that variables, properties, and methods by default belong to the  window object. This also means that specifying the `window` keyword is optional:
  
```html
<!DOCTYPE html>
<html>
<body>

<h2>My First Web Page</h2>
<p>My first paragraph.</p>

<p>Never call document.write after the document has finished loading.
It will overwrite the whole document.</p>

<script>
document.write("<h1>What is love</h1>");
window.alert("Baby don't hurt me");
</script>

</body>
</html> 
```

  

### Print 

`window.print()` will print the current window just like pressing `ctrl+p`



## Variables

- are not type declared

- `var` indicates that something is a variable 

- The 2015 version of JavaScript (ES6 - ECMAScript 2015) allows the use of the `const` keyword to define a variable that cannot be reassigned, and  the `let` keyword to define a variable with restricted scope.

- Using the underscore is not very common in JavaScript, but a convention among professional programmers is to use it as an alias for "private (hidden)" variables.

- Using the dollar sign is not very common in JavaScript, but professional programmers often use it  as an alias for the main function in a JavaScript library.
In the JavaScript library jQuery, for instance, the main function `$` is used to select HTML elements. In jQuery `$("p");` means "select all p elements".
-   Variables are **local** to their function.


## Operators

- are the same as C++👑

- Strings can be concatenated with +

## Comments

- are the same as C++👑

## Keywords

| Keyword         | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| `break`         | Terminates a switch or a loop                                |
| `continue`      | Jumps out of a loop and starts at the top                    |
| `debugger`      | Stops the execution of JavaScript, and calls (if available) the debugging  function |
| `do ... while`  | Executes a block of statements, and repeats the block, while a condition is  true |
| `for`           | Marks a block of statements to be executed, as long as a condition is true |
| `function`      | Declares a function                                          |
| `if ... else`   | Marks a block of statements to be executed, depending on a condition |
| `return`        | Exits a function                                             |
| `switch`        | Marks a block of statements to be executed, depending on different cases |
| `try ... catch` | Implements error handling to a block of statements           |
| `var`           | Declares a variable                                          |

## Type Operators

| Operator     | Description                                                |
| ------------ | ---------------------------------------------------------- |
| `typeof`     | Returns the type of a variable                             |
| `instanceof` | Returns true if an object is an instance of an object type |

# Types

## JavaScript Objects

JavaScript objects are written with curly braces `{}`.

Object  properties are written as name:value pairs, separated by commas.

```javascript
var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
```

# Events 

| Event       | Description                                        |
| ----------- | -------------------------------------------------- |
| onchange    | An HTML element has been changed                   |
| onclick     | The user clicks an HTML element                    |
| onmouseover | The user moves the mouse over an HTML element      |
| onmouseout  | The user moves the mouse away from an HTML element |
| onkeydown   | The user pushes a keyboard key                     |
| onload      | The browser has finished loading the page          |

The list is much longer: [W3Schools JavaScript Reference HTML DOM Events](https://www.w3schools.com/jsref/dom_obj_event.asp).

# Strings

[For string methods](https://www.w3schools.com/js/js_string_methods.asp)

Escape Sequences

| Code | Result               |
| ---- | -------------------- |
| \b   | Backspace            |
| \f   | Form Feed            |
| \n   | New Line             |
| \r   | Carriage Return      |
| \t   | Horizontal Tabulator |
| \v   | Vertical Tabulator   |
|      |                      |

## Finding a String in a String

The `indexOf()` method returns the index of (the position of)  the `first` occurrence of a specified text in a string:

```javascript
var str = "Please locate where 'locate' occurs!";
var pos = str.indexOf("locate");
```

The `lastIndexOf()` method returns the index of the **last**  occurrence of a specified text in a string:

## Searching for a String in a String

The `search()` method searches a string for a specified value  and returns the position of the match:

```javascript
var str = "Please locate where 'locate' occurs!";
var pos = str.search("locate");
```

