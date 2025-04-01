---
theme:  post
date:   13-05-2021
title:  "NIX: Small/Random, but Useful patterns"
tags: [nix]
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

---

## Zlib package Haskell

Working on my dissertation I wanted to have a `nix-shell` where I could test in
a fast manner my *web-interface* for the FMCt. I was initially doing this:

```nix
{ release  ? import ./release.nix
, sources  ? import ./nix/sources.nix
, pkgs     ? import sources.nixpkgs{}
, FMCt-web ? import ./default.nix
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs;[
    cabal-install
    ghcid # ghcide
    gnumake               # makefile
    haskellPackages.aeson
    haskellPackages.blaze-markup
    haskellPackages.hlint # linting
    haskellPackages.scotty
    haskellPackages.zlib
    haskellPackages.ghc
    rlwrap                # to be able to easily re-enter last input when in the repl
  ];
}
```

The issue I was having was getting the following error: 
```bash
<command line>: can't load .so/.DLL for: libz.so (libz.so: cannot open shared object file: No such file or directory)
```

Which was very annoying, as I thouth I was provisioning both the environment and
the package for `haskellPackages.zlib`. Where I was wrong was in the following
bit: making the haskellPackages available to the environment is only useful if
we need the executables. If we need the libraries the correct way to do it is
the following:

```nix
{ release  ? import ./release.nix
, sources  ? import ./nix/sources.nix
, pkgs     ? import sources.nixpkgs{}
, FMCt-web ? import ./default.nix
}:
let 
  # add ghc packages that should be available to the ghc here
  ghc = (pkgs.haskellPackages.ghcWithPackages (
    hpkgs: with hpkgs;[
      zlib
      scotty
      aeson
      blaze-markup
      aeson
    ]
  ));
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs;[
    cabal-install
    ghc
    haskellPackages.hlint # linting
    # ... 
  ];
}
```

This was very helpful for me to see, that actually it is not the environment
that needs to be provisioned, but rather ghc itself. Hence why `ghcWithPackages`
solved the issue.

