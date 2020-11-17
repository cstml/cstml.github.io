---
layout: post
title: 'unix: symbolic links'
date: 2019-03-28
updated: 2020-05-24
---
# Symlinks
---
- Symbolic links are references to a file

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

### Further Reading
[link](https://medium.com/@meghamohan/hard-link-and-symbolic-link-3cad74e5b5dc)
