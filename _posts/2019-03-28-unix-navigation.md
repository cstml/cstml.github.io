---
layout: post
title: 'unix: navigation'
date: 2019-03-28
updated: 2020-05-24
---

Quintessential to any programmer is being fluid and capable inside the terminal. Although there are loads of people that do not use bash in their daily coding life, having the knowledge to do so will make anyone's life a lot easier.

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

Changes the directory you are currently in to the inputted file path

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

---
# Reading Files 
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

# Creating/Manipulating Files 
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

---
# stdin stdout stderr

These are the basic input output and error ouputs chanels of UNIX. The best way to see how this works is through a practical example


```bash
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
```txt
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
```

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

---
# Symlinks
---

Good article on the subject can be found at:

[link](https://medium.com/@meghamohan/hard-link-and-symbolic-link-3cad74e5b5dc)

## Hardlink
A hardlink is much like a pointer to the same information, which in this case it is called inode. 
```
ln <source> <source>
```

## Symlink
A symlink is much more like a classical shortcut. 
In order to create a symlink all you need to do is: 
```
ln -s <source> <linkname>
```

# Mounting Drives

One time mounting is done through the use of `mount`.

Mounting drives at boot is done under `etc/fstab`. It is pretty self explanatory how to do it and the manual is pretty clear on it.

To find the connected drives or devices that can be mounted `blkid` is the command you are looking for. Usually you would want to mount the drives in `/mnt` and to avoid all of the auth processes you would `chown <user>:<user>`. 

### Mounting a NAS

(Network Attached Storage)

You need to install CIFS utils pkg

`sudo apt install cifs-utils`

# Managing start-up services

|                                        |                                                              |
| -------------------------------------- | ------------------------------------------------------------ |
| `systemctl`                            | shows all of the packages that are managed at boot time and whatnot |
| `systemctl -at service`                | shows only the services                                      |
| `systemctl -at service -state=active`  | shows only the active ones                                   |
| `systemctl list-unit-files`            | To see the files with their status as enabled or not, you can run grep on this |
| `sudo systemctl (en)disable <service>` | To (en)disable a service                                     |
| `sudo systemctl (un)mask <service.`    | To mask/unmask a service                                     |

# Repeating a function in the terminal

It is as simple as that. `watch` will repeat a function in the terminal at a specified interval

```
watch -n 2 "ls -l"
```

This command wil simply apply `ls -l` every 2 seconds and it will read the output
