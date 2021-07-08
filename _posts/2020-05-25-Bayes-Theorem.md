---
layout: post
title:  "math: Bayes Theorem"
date:   2020-05-24 
categories: mathematics
tags: Python Educational WIP
---

<!--- I've added this section for Kramdown to be able to read the math-->

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: [
      "MathMenu.js",
      "MathZoom.js",
      "AssistiveMML.js",
      "a11y/accessibility-menu.js"
    ],
    jax: ["input/TeX", "output/CommonHTML"],
    TeX: {
      extensions: [
        "AMSmath.js",
        "AMSsymbols.js",
        "noErrors.js",
        "noUndefined.js",
      ]
    }
  });
</script>

<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
<!---the section ends here -->

To better define **Bayes Theorem**, one must have a good understanding of what
all the constituent parts within it. For my own and everyone's benefit I will
break them down as much as possible. If you see any mistake, please point it out
to me via GitHub, as I have written these myself in a creative frenzy.

# Probability


Probability can be defined as the number of favourable, or true outcomes of a
hypothesis in relation to the number of total outcomes.

$$
\; P(A)=\frac{cardinal(A=True)}{cardinal(total \; posibilities)}
$$

### Example 

If you want to find the probability of a fair coin of being tails, 

- the number of favourable outcomes is 1
- the number of possible total outcomes is 2

$$
\begin{align*}
P(Tails)&=\frac{1}{2}\\\\
&=\frac{50}{100}\\\\
&=50\%\\\\
&=1 \text{ out  of  } 2\\\\
&= 1/2
\end{align*}
$$

As you can see from the above example, probability can be written in
many-a-ways. It is important to remember what it stands for. As basic as it is.

----

# Conditional Probability

Conditional Probability defines the probability of a Hypothesis being true,
based on a second event happening - hypothesis being true.

### Notation:

$$
\begin{align}
\;P(A|B)&=\frac{P(A ⋀ B)}{P(B)}\\
\end{align}
$$

Where the probability of hypothesis A given event B equals the probability
of A and B being *true* divided by the probability of B. 


### Example 1

Say we have a urn with:

- 30 white marbles, 10 of which are small
- 70 black marbles


If we randomly draw a marble from the urn, what is the probability of it  being small if it is white?

$$
\begin{align*}
P(small|white) &= \frac{P(small⋀ white)}{P(white)}\\
&= \frac{10}{30}= 1/3
\end{align*}
$$

### In other forms


This is real exciting! Using some algebra we can derive loads of wonderful equations from the above simple statement

$$
\begin{align*}
P(A|B)&=\frac{P(A ⋀ B)}{P(B)}\\ \\
P(B)&=\frac{P(A ⋀ B)}{P(A|B)}\\ \\
P(A ⋀ B) &= P(B) \cdot P(A|B))   \\ \\
WOW! \; &That's \; fantastic
\end{align*}
$$

### Example 2

Say we have a urn with:

- 30 white marbles
- 70 green marbles
- 10 red marbles


We draw a ball out, what is the probability the ball is green given the fact that it is not white?

$$
\begin{align*}
P(green|¬white) &= \frac{P(green ⋀¬white)}{P(¬white)} =  \frac{P(green)}{P(¬white)}\\
&= \frac {70/110}{(10+70)/110} =7/8=87.5\%
\end{align*}
$$


It is interesting to see how through logic the negation is substitute with the element itself.


### Example 3

We have a 6 faced fair dice and we roll it.  

Given that when we roll it the dice number is higher than 2 what is the probability of it being 5 or 6. 
$$
P(5 ⋁ 6|>2) = \frac{P((5 ⋁ 6) ⋀ <2)}{P(>2)} = 2/4 = 50\%
$$

### Example 4

We have the following results in a school's grades

|    |  Arts | Math | Science |
|----|-------|------|---------|
| A  | 50    | 130  | 20      |
| B  | 220   | 25   | 60      |
| C  | 10    | 25   | 40      |


What is the probability of a random student having  grades of A  given the fact that they are  studying Math or Science.

$$
P(A |M ⋁ S) = \frac {P((A ⋀(M ⋁ S))}{P(M ⋁ S)}=\frac{(130+20)/605}{300/605}=0.5
$$

But what about the reverse? What is the probability of  a random student with A grades to be studying Math or Science?

$$
P(M ⋁ S | A)= \frac {P((M ⋁ S) ⋀ A)}{P(A)}=\frac{(130+20)/605}{(50+130+20)/605}=.83
$$

As you can see from above, usually 

$$
P(A|B) \neq P(B|A)
$$

--------

# More Bayes Theorem

Bayes Theorem describes mathematically the probability of an event, based on
prior knowledge of conditions that could be related to the event.

It was discovered by Reverend Thomas Bayes around 1763, and independently by
Pierre-Simon Laplace in 1774.  Sir Harrold Jeffreys (an English mathematician,
statistician and geophysicist) wrote that Baye's Theorem "is to the theory of
probability what Pythagorean Theorem is to geometry".

 

Let's have a look at it in the form one will be most likely to find it:

$$
P\left(H|E\right)=\frac{P\left(E|H\right)P\left(H\right)}{P\left(E\right)}\\
$$



Let us brake it down and understand what is going on. 

$$
\begin{aligned}
                &P\left(H|E\right)=\frac{P\left(E|H\right)P\left(H\right)}{P\left(E\right)}\\
                Where:&\\
                E & \; is \; an \; event\\
                H & \; is \; a \; hypothesis \; of \; the \; event \; happening\\                
                P\left(H|E\right) & \; is \; the \; probability \; of \; the \; hypothesis \; H \; being \; true \; given \; the \; event \; E\\
                P\left(E|H\right)& \; is \; the \; probability \; of \; the \; event \; E \; being \; true \; given \; the \; hypothesis \; H\\       
                P\left(H\right)& \; is \; the \; probability \; of \; the \; the \; hypothesis \; H \; being \; true \\  
                P\left(E\right)& \; is \; the \; probability \; of \; the \; event \; E \; being \; true
            \end{aligned}
$$

Why is it great?

$$
\begin{align*}
P(A|B)&=\frac{P(B|A)\cdot P(A)}{P(B)}\\ \\
some \;algebraic \; manipulation \; and \\ \\
P(B)&=\frac{P(B|A)\cdot P(A)}{P(A|B)}\\ \\
P(B)&=\frac{\frac{P(B ⋀ A)}{P(A)}\cdot P(A)}{P(A|B)}=\frac{P(B ⋀ A)}{P(A|B)}\\
&\;. \\
&\;. \\
&\;. \\ 
&etc. \\ \\
The \; possib&ilites \; are \; endless \\ \\
"A \; true \; Pythagorean \;&Theorem \; of \; statistics"
\end{align*}
$$



So yes, give it a go and use it! I will cut the post to here because it has become quite a long one.

---

# Some further probability identities 

$$
\begin{align}
P(\Omega) = 1 \text { where $\Omega$ is the entire sample space } 
\end{align}
$$

## Law of total 
