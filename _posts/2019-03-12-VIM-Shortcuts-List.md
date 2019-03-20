---
layout: post
title: "VIM Cheat Sheet - Condensed"
---


# Jumping around the file

|   Command    |    Result  |
|--------------|------------|
|`'.`          |Jump to the last modification line| 
|`.|Jump to the last place modified| 
|CTRL-0|Retrace your movements in file in backwards.|
|CTRL-I|Retrace your movements in file in forwards.|    

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
