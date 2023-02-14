---
layout: post
title: 'unix: files CRUD'
date: 2019-03-28
updated: 2020-05-24
---

## cat 
reads the output to the screen 

*Example:*


```bash
%%bash
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
cat
```

## cp & rm

**cp** copies the file and **rm** deletes the file

*Example:*


```bash
%%bash
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls
echo 
cp input.txt input_copy.txt
ls
echo
rm input_copy.txt
ls
```

    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    input_copy.txt
    output.txt
    output2.txt
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt

## mkdir 

Creates a new folder in the current folder or the a specified place

*Example:*


```bash
%%bash
echo The folder currently contains:
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls
echo 
mkdir test
echo The folder currently contains:
#This bit is there just so I can keep my folders clean
ls
rm -d test
```

    The folder currently contains:
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    
    The folder currently contains:
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    test

### Tip

If you want to create all the dirs for a path use `mkdir -p` 



## mv

Moves a file from one location to another
*Example:*


```bash
%%bash
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls
echo
mkdir test
ls
echo
echo "make a folder"
mv input.txt ./test/input.txt
ls
echo
mv ./test/input.txt ./
ls
echo
rm -d test
ls
```

    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    test
    
    make a folder
    2018-03-06-UNIX-Commands.ipynb
    output.txt
    output2.txt
    test
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    test
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt


## Sort
Sorts the files inside a text file

*Example:*


```bash
%%bash
echo "##Output##"
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls
echo
sort input.txt
echo 
echo "#Using -r reverses the result of the comparison"
sort -r input.txt
```

    ##Output##
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt
    
    Hello World!
    How Are you Today?
    
    #Using -r reverses the result of the comparison
    How Are you Today?
    Hello World!
