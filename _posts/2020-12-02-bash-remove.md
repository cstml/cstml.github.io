---
theme: post
date: 04-12-2020
title: "bash: remove all but file"
---

I found myself wantig to delete all the files in a folder but specifc ones.
What better use but a bash script for this 

```bash
find . | grep -v ".md" | grep -v ".pdf" | xargs rm 
```

Nice!
