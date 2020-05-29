---
layout: post
title:  "Bayes Theorem"
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
Bayes Theorem describes mathematically the probability of an event, based on prior knowledge of conditions that could be related to the event.

It was discovered by Reverend Thomas Bayes around 1763, and independently by Pierre-Simon Laplace in 1774.  Sir Harrold Jeffreys (an English mathematician, statistician and geophysicist) wrote that Baye's Theorem "is to the theory of probability what Pythagorean Theorem is to geometry".

 

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

Let's take a quick example:

In a bag there are:

- 30 white balls and 70 black balls
- 20 white balls have an x
- 10 black balls have an x

What is the chance if we draw a ball with an x for it to be black?

	

				x\begin{aligned}                &P\left(H|E\right)=\frac{P\left(E|H\right)P\left(H\right)}{P\left(E\right)}\\                Where:&\\                E & \; is \; an \; event\\                H & \; is \; a \; hypothesis \; of \; the \; event \; happening\\                                P\left(H|E\right) & \; is \; the \; probability \; of \; the \; hypothesis \; H \; being \; true \; given \; the \; event \; E\\                P\left(E|H\right)& \; is \; the \; probability \; of \; the \; event \; E \; being \; true \; given \; the \; hypothesis \; H\\                       P\left(H\right)& \; is \; the \; probability \; of \; the \; the \; hypothesis \; H \; being \; true \\                  P\left(E\right)& \; is \; the \; probability \; of \; the \; event \; E \; being \; true            \end{aligned}
				$$
