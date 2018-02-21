---
layout: post
title:  "Beware Trolls (also zombies)!"
date:   2018-02-20 20:41:12 +0000
categories: python
tags: Python Educational WIP
---
# A bit of an intro

I haven't been coding in a while, so to kick some of that sedimented rust that I have somehow accumulated I challenged myself to learn a new coding language. The *almighty* 'Python'.

So I've decided to start by looking up an idea for a project and I stumbled upon: [Reddit Daily Programmer][Reddit-challenge]

Anyway, to keep it short.

# How it started

{% highlight python %}
def move_permitted(self,direction,character,step):
        """
        Check if move is permitted
        by checking if the square where
        you want to move is free
        and inside the map
        """
        if (direction == 0) :   #if direction is up
            if character.posx > step:    
                if self.board[character.posx-step][character.posy] is " ": 
                    return 1
                elif self.board[character.posx-step][character.posy] is "X":
                    return 2
                else:
                    return 0

        elif (direction == 3):    #if direction is right
            if character.posy +step < self.maxy:
                if self.board[character.posx][character.posy+step]==" ": 
                    return 1
                elif self.board[character.posx][character.posy+step] is "X": 
                    return 2
            else:
                return 0

        elif (direction == 2):    #if direction is down
            if character.posx + step < self.maxx:
                if self.board[character.posx+step][character.posy]==" ": 
                    return 1
                if self.board[character.posx+step][character.posy] is "X": 
                    return 2                
                else:
                    return 0
            else:
                return 0

        elif (direction == 1):    #if direction is left
            if character.posy > step:
                if self.board[character.posx][character.posy-step]==" ": 
                    return 1
                elif self.board[character.posx][character.posy-step] is "X": 
                    return 2
                else:
                    return 0
        return 0
{% endhighlight %}

Needless to say that is one (to quote Arnie) __Ugly (...)__ piece of code to define a simple and elementary opperation. Moving up or down of the character. Which led me to the existential question:

*I am using the direction number because functions can only return a __singular__ number. But is there a way around it?*

{% highlight python %}
def move_permitted(self,direction_x,direction_y,character):
        """
        Check if move is permitted
        by checking if the square where
        you want to move is free
        and inside the map
        """
        x = direction_x+character.posx
        y = direction_y+character.posy
        if (x>=0) && (x<=self.maxx) :   #if it is boundary
            if (y>=0) && (y<=self.maxy)
                if self.board[x][y] is " ": 
                    return 1
                elif self.board[x][y] is "X":
                    return 2
                else:
                    return 0
        return 0
{% endhighlight %}

But this is where my 

And that is how I stumbled upon: __TUPLES__

# Tuples

{% highlight python %}
import collections
Point = collections.namedtuple('Point', ['x', 'y'])
p = Point(1, y=2)
print (p.x, p.y)
print (p[0], p[1])
#>1 2
#>1 2
{% endhighlight %}

As Python [Documentation][py_tu] proves it, a Tuple is a *great* way of structuring data to create a new data type. And it can be **returned** by a function. Which would make the code from above become something a lot more elegant. Something like this: 

{% highlight python %}
insert code
{% endhighlight %}


Check out the project's [Git-Hub][Project_github] for for more info.

[Reddit-challenge]: https://www.reddit.com/r/dailyprogrammer/comments/4vrb8n/weekly_25_escape_the_trolls/
[Project-github]: https://github.com/cstml/escape_the_trolls
[py_tu]: https://docs.python.org/3/tutorial/datastructures.html