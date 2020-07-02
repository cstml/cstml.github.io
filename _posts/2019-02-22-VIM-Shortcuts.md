---
layout: post
title: "VIM Cheat Sheet"
date: 2019-11-23
Updated last: 2020-05-24
---

# VIM Commands 

I am constantly trying to improve my VIM knowledge. Being an old Linux user I
love VIM and have always seen it as real art. Aaaanyway, let's jump right into
it:

# VIM favourites

## Indentation
to Indent stuff just use ">>" or "<<"

To reformat text "gq" is a super useful and fast command.

## Browser
One cool thing about VIM is that it comes with a browser plugin called
**netrw**

For a more detailed article on this go to this
[link](https://shapeshed.com/vim-netrw/)

To open this explorer all you have to do is 
```
:Explore
or
:E
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
--------------------------------------------
### Where to find the VIMRC on a Microsoft PC

```
:version
:echo expand('~')
:echo $HOME
:echo $VIM
:echo $VIMRUNTIME
```

--------------------------------------------
# Tabs
A cool thing to do with tabs is save the current session you are in. 
- Have all of the tabs in your session open
- Type the next command:
```
:mksession header-files-work.vim
```
- Close Vim

To open the session either:
- start the session with vim -S header-files-work.vim
- in vim type `:source header-files-work.vim` 

To update a session:
- simply type : `:mks!`

--------------------------------------------
# Autocomplete without a plugin 
`ctrl+n` in edit mode


--------------------------------------------
# Marks 
Marks are pretty cool ways of navigating files
- to create a mark at a specific line in the local file : press `m` followed by a lower case letter `a`
- to see marks in the document `:marks`
- to create marks across documents : press `m` followed by a capital letter`
- to go to a mark : press ``` followed by the letter you want to go to 

--------------------------------------------
# Indentation 
To correct a files indentation
```
=i{
```
--------------------------------------------
# Clipboards
At any point you can use several clipboards inside VIM
- They are called `registers` and you can see them by typing `:reg`
- To choose which register to use: `"a` for register a
- To yank a line into a register ` "ayy" `
- To paste from a register `"aP"`
--------------------------------------------
# Folds

| Command    | Action                                                   |
|------------|----------------------------------------------------------|
| zf#j       | creates a fold from the cursor down # lines.             |
| zf/string  | creates a fold from the cursor to string.                |
| zj         | moves the cursor to the next fold.                       |
| zk         | moves the cursor to the previous fold.                   |
| zo         | opens a fold at the cursor.                              |
| zO         | opens all folds at the cursor.                           |
| zm         | increases the foldlevel by one.                          |
| zM         | closes all open folds.                                   |
| zr         | decreases the foldlevel by one.                          |
| zR         | decreases the foldlevel to zero — all folds will be open |
| zd         | deletes the fold at the cursor                           |
| zE         | deletes all folds.                                       |
| zf         | Create fold on the selection                             |
| [z         | move to start of open fold                               |
| ]z         | move to end of open fold                                 |

--------------------------------------------

## Resize split 

|   Command    |    Result  |
|--------------|------------|
|:resize 50  |Resize window's height to 50 lines|
|:resize +50  |Resize window's height to 50 lines|
|:resize +50  |Resize window's height to 50 lines|
|:vertical resize 100| Resize window's width to 100|

# Jumping around the file

|   Command    |    Result  |
|--------------|------------|
|'.|Jump to the last modification line|
|`.|Jump to the last place modified|
|CTRL-0|Retrace your movements in file in backwards.|
|CTRL-I|Retrace your movements in file in forwards.|

# Moving around the file

|   Command    |    Result  |
|--------------|------------|
|CTRL-U|Move up|
|CTRL-D|Move down|
|CTRL-F|Move forward|
|CTRL-B|Move backwards|

# Marks

|   Command    |    Result  |
|--------------|------------|
|`ma`          |Places mark a|
|'a|    Placese the cursor at `mark a` line|
|`a|    Places the cursor at `mark a` marked character|


# Reformat code

|   Command    |    Result  |
|--------------|------------|
|gg=G| gg goes to the top of the file, = is a command to fix the indentation and G tells it to perform the operation to the end of the file.|
|wgw|   Applies wrapping on the current line|
|:set tw=79| Sets the textwidth for wrapping|
|:set fo-=l| Sets the text to automatically wrap|
|:set tw=0| Stops the automatic wrapping|

# Spellchecker

|   Command    |    Result  |
|--------------|------------|
|:setlocal spell spelllang=en_gb|sets the language of the local buffer to GB English|
|:set spell spelllang=en_gb|sets the language of the local buffer to GB English|
|z=|    suggest a list of alternatives|
|]s|move the cursor to the next misspelled word|
|s[|move the cursor to the next misspelled word|


# Pipes

|   Command    |    Result  |
|--------------|------------|
|:r !ls |    Output From !ls is written into the text|
|---|---|

# File Opening\Closing

|   Command    |    Result  |
|--------------|------------|
|---|---|
|vim -p *.tex|  Opens all the .tex files in sepparate tabs|
|:saveas | allows one to saveas - does not delete the old file|

# Terminal

| Command            | Result                                 |
| ------------------ | -------------------------------------- |
| :terminal          | opens a terminal                       |
| :vertical terminal | opens a terminal with a vertical split |
| CTRL+W :quit       | quit the terminal                      |

--------------------------------------------

# Some further reading: 
- (https://medium.freecodecamp.org/learn-linux-vim-basic-features-19134461ab85)
- (https://www.cs.swarthmore.edu/oldhelp/vim/completion.html)
- [http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html)
