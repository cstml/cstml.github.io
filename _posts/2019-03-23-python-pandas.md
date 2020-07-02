---
layout: post
title: "Python Pandas"
---
## Good resoures
[10 Python Pandas tricks that make your work more efficient](https://towardsdatascience.com/10-python-pandas-tricks-that-make-your-work-more-efficient-2e8e483808ba)

# value counts
This is a command to check value distributions. 
For example, if you’d like to check what are the possible values and the frequency for each individual value in column ‘c’ you can do df['c'].value_counts() 

There’re some useful tricks / arguments of it: 
A) normalize = True: if you want to check the frequency instead of counts.  
B) dropna = False: if you also want to include missing values in the stats.  
C) sort = False: show the stats sorted by values instead of their counts.  
D. df['c'].value_counts().reset_index(): if you want to convert the stats table into a pandas dataframe and manipulate it

# number of missing values

```python
import pandas as pd
import numpy as np
df = pd.DataFrame({ 'id': [1,2,3], 'c1':[0,0,np.nan], 'c2': [np.nan,1,1]})
df = df[['id', 'c1', 'c2']]
df['num_nulls'] = df[['c1', 'c2']].isnull().sum(axis=1)
df.head()
```
