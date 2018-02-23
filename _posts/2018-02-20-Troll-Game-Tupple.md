---
layout: post
title:  "*WIP* Beware Trolls (also zombies)!"
date:   2018-02-20 20:41:12 +0000
categories: python
tags: Python Educational WIP
---
### Disclaimer
This project is currently WIP. I am working on developing it and refining it in my after-work hours. Thus I will continue updating this post, so please stay tuned in.

# An intro
![Animation showing game][animation]


Although at work I currently do a lot of visual coding (Rhino's Grasshopper mostly) and geometry generation, I haven't been coding like I used to for a while now. So to kick some of that sedimented dust that I have accumulated I challenged myself to learn a new coding language. The *almighty* __'Python'__.

 Looking up an idea for a project I stumbled upon: [Reddit Daily Programmer][Reddit-challenge]

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

Needless to say that is one __Ugly (...)__ piece of code to define a simple and elementary opperation. You don't have to look close to be able to see that I am repeating myself needlessly. Which led me to the existential question:

__*Is there a lazier(more efficient) way of doing this?*__

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
            if (y>=0) && (y<=self.maxy):
                if self.board[x][y] is " ": 
                    return 1
                elif self.board[x][y] is "X":
                    return 2
                else:
                    return 0
        return 0
{% endhighlight %}

Again I looked at this and I though, wait a minute.

__*Is there a lazier way of doing this? I can surely avoid calling direction_x and direction_y everytime I need to addres a point or a move.*__ 

And that is how I stumbled upon: __Named Tuples__

# Named Tuples

#### Example:

{% highlight python %}
import collections
self.Direction = collections.namedtuple('Direction', 'x y')
{% endhighlight %}

As Python [Documentation][py_tu] proves it, a Named Tuple is a great way of structuring data to create a new data type. And most importantly, it can be **returned** by a function. A fantastic method of working especially when you are guiding around information which comes in pairs. *In my case, a direction of movement which is composed of two components, namely the x & y.*

{% highlight python %}
 def move_permitted(self,direction,character):
        """
        Check if move is permitted
        by checking if the square where
        you want to move is free
        and inside the map
        """
        x = direction.x+character.posx
        y = direction.y+character.posy
        if (x>=0) and (x<=self.maxx):   #if it is boundary
            if (y>=0) and (y<=self.maxy):
                if self.board[x][y] is " ": 
                    return 1
                elif self.board[x][y] is "X":
                    return 2
                else:
                    return 0
        return 0
{% endhighlight %}


Check out the project's [Git-Hub Page][project_github] for for more info.

[Reddit-challenge]: https://www.reddit.com/r/dailyprogrammer/comments/4vrb8n/weekly_25_escape_the_trolls/
[project_github]: https://github.com/cstml/escape_the_trolls
[py_tu]: https://docs.python.org/3/tutorial/datastructures.html
[animation]: https://i.imgur.com/nhpGprV.gif
