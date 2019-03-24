---
layout: post
title: "Unix/Bash Commands"
---
# UNIX/Bash navigation and commands

Quintesential to any programmer is being fluid and able inside the terminal. Although there are loads of people that do not use bash in their daily coding life. Having the knowledge to do so will make anyone's life a lot easier.

# Common UNIX/Bash commands

## pwd
Prints the filepath of the directory you are currently in

*Example:*


```bash
%%bash
pwd
```

    /Users/Costumel


## cd
*Stands for Change Directory*

Changes the directory you are currently in to the inputed file path

*Example:*


```bash
%%bash
pwd
cd ./Coding/01_Website/cstml_web/Jupyter_Notebook/
pwd
cd ..
pwd
cd ~
pwd
cd -
pwd
cd /
pwd
```

    /Users/Costumel
    /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook
    /Users/Costumel/Coding/01_Website/cstml_web
    /Users/Costumel
    /Users/Costumel/Coding/01_Website/cstml_web
    /Users/Costumel/Coding/01_Website/cstml_web
    /


The directories can be changed with the help of:

**cd .** - uses the existing file path, usually used to go proceed going down the directory tree  

**cd ..** - changes the directory to the parent directory

**cd ~** - changes the directory to the home directory.

**cd -** - takes you back to the previous directory

## ls
Lists the contents of the current folder

*Example:*


```bash
%%bash
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls 
```

    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    output2.txt


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


# How to use **stdin stdout stderr**

These are the basic input output and error ouputs chanels of UNIX. The best way to see how this works is through a practical example


```bash
%%bash
cd /Users/Costumel/Coding/01_Website/cstml_web/Jupyter_Notebook/
ls
echo
(ls;ls) > output.txt
ls
echo
echo "#Contents of output.txt:"
cat output.txt
echo
echo "#Contents of output2.txt:"
sort output.txt > output2.txt
cat output.txt >> output2.txt
cat output2.txt
rm output2.txt
rm output.txt
```

    2018-03-06-UNIX-Commands.ipynb
    input.txt
    
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    
    #Contents of output.txt:
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    
    #Contents of output2.txt:
    2018-03-06-UNIX-Commands.ipynb
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    input.txt
    output.txt
    output.txt
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt
    2018-03-06-UNIX-Commands.ipynb
    input.txt
    output.txt


Basically in this example we are using the output from **ls** to write in **output.txt**. More interestingly we manged to group the two commands by putting them in a paranthesis, which will also group their output into one. 

An interesting and useful thing is the difference between **>** and **>>**. If we look carefully when using **>** we will see that the existing contents of the file will be overwritten whilst when using **>>** the contents of the file will be appended to the end of the document.

To write the stderr to a file:
```
command 2>file.txt
```

To write the **stderr** to the stdout
```
command 1>output.tx 2>$1
```

And basically that was it, hope you find it useful!
