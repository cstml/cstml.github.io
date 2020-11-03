---
layout: post
title: "python: matplotlib.pyplot"
---
## Good resources
[matplolib Pyplot Tutorial](https://matplotlib.org/users/pyplot_tutorial.html)

# typical header
Whilst working with Virtual Environments, Python needs to be set up as a framework to allow for matplotlib library to be loaded. A workaround that works is:

```python
import matplotlib as mpl
mpl.use('TkAgg')
import matplotlib.pyplot as plt
```

# save to file
I much prefer outputting to a file rather than prompting to a buffer
```python
    t = np.arange(0.0, 2.0, 0.01)
    s = np.sin(2 * np.pi * t)
    fig, ax = plt.subplots()
    ax.plot (t,s)
    plt.savefig("fig.png")           #Plotting a figure nice and easy
```
