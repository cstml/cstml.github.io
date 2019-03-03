---
layout: post
title: "VIM Cheat Sheet"
---

# VIM Commands 

I am constantly trying to improve my VIM knowledge. Being an old Linux user I love VIM and have always seen it as real art. Aaaanyway, let's jump right into it:

# VIM favourites

## Indentation
to Indent stuff just use ">>" or "<<"

## Browser
One cool thing about VIM is that it comes with a browser plugin called **netrw**

For a more detailed article on this go to this [link](https://shapeshed.com/vim-netrw/)

To open this explorer all you have to do is 
```
:Explore
```
- with `i` you can change the view type

- with `I` you can hide the header

This is good for browsing your file structure but you can always use the bash from within VIM by doing `:!ls` or even `:!tree`.

- `:e *` opens the most recent version of a file
- `:e` opens the most recent version of the file itself

--------------------------------------------------------------------------------
(Update*24.02.19*)
Nowadays, I usually use this plugin called [NERDtree](https://github.com/scrooloose/nerdtree), which gives you a nice file browser on the side of your window.

## ctags
One of the most powerful things when it comes to finding definitions in your file structure.

ctags basically allows you to find where a function is defined within your file structure. In order to make it work you have to install it.

On mac this is a very simple case of `brew install ctags`

Afterwards, one has to intialise the ctags within the project folder. This is done by running:
```
ctags -R
```

This recursively will search through your file tree and map your *ctags*

In order to use them within VIM, you have to put the cursor on the definition of whatever you need and then press `<C-]>`(**Control closed bracket**)

To jump back to the root file all you have to do is press `<C-o>` (**Control o**)

# Recording
I absolutely love macros and recording commands. The ease of creating such things in VIM is absolutely **Awesome**. To record any macro you simply:

Press `q` followed by any letter you want to map it to. For example `w`. After this you just type or do the command you would like Macro-ed. `A ; esc j` followed by pressing `q` again. And that's it, your Macro has been created.

To use it, all you have to do is call it with `@` in our case `@w`

Do you want it to be called twice? No worries just use `2@w`.

# Normal
Another really handy thing is `:norm` or `:normal` which basically takes whatever you type after it and normally executes it. For example you want to add 8x`-`. 
Well then all you have to do is 

`:norm 8i-` and **BAM** `--------`
## Terminal

## Searching

### Searching and replacing across the buffer
```
:bufdo %s/pattern/replace/ge | update
```
### Pattern notation:
```
\<old_text\> 
```
