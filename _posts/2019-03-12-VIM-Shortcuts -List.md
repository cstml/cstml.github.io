---
layout: post
title: "VIM Cheat Sheet - Condensed"
---
|Command|Result|
|---|---|
|File Navigation|
|---|---|
|`'.`|Jump to the last modification line| 
|```
`.```|Jump to the last place modified| 
|---|---|
|Reformat code|
|---|---|
|gg=G| gg goes to the top of the file, = is a command to fix the indentation and G tells it to perform the operation to the end of the file.|
|---|---|
|Pipes|
|---|---|
|:r !ls |    Output From !ls is written into the text|
|---|---|
|File Opening||
|---|---|
|vim -p *.tex|  Opens all the .tex files in sepparate tabs|
|:saveas | allows one to saveas - does not delete the old file|
|File Saving||
