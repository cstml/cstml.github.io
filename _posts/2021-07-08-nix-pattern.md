---
theme:  post
date:   13-05-2021
title:  "NIX: Small but Useful pattern"
---

Say you have a few packages that you would like to build but you want an easy
way of doing so.  Here's a handy little pattern that could help out. 

```nix
# suppose this is your default.nix
# although I recommend separating the shell.
{
    pkgs ? import <nixpkgs>{}
}:rec{
  output = with pkgs;[hello cowsay];
  shell = pkgs.mkShell {
      name = "Shell";
      buildInputs = output;
      };
}
```

So now to build everything in output all you need to do is run:
```nix
nix-build default.nix -A output
```
which will subsequently generate all the derivations inside the list. And if
you just wanted to run a shell with them you could do:
```nix
nix-shell default.nix -A shell
```
and you would be in a shell with all your needed binaries included. 

## Nesting

So this is probably where I would say this pattern comes in handy. Let's say
the above `default.nix` is actually inside a nested folder which we will call
`./nest`.

And we actually want to call the derivation inside our root folder `./.`. The
trick is to call them in the same way, from the root `default.nix`.
```nix
{
    pkg ? import ./nest {}
}
:let
  out = pkg.output;
in
  out
```
which will then build both derivations inside the root folder. I think this is
pretty cool, what do you say?

