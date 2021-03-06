# Install instructions

All you have to do is clone this repository into `~/texmf/tex/latex` (or whatever your personal texmf happens to be). So just run

    cd ~/texmf/tex/latex
    git clone https://github.com/chennisden/chennistex

# This repository is not a good example of TeX code.

There is a reason this is not in CTAN.

I hacked together `dennis.cls` when I was a middle schooler still using Overleaf, and I honestly do not want to look back on that and actually maintain it. These classes are only *semi-supported*, meaning if you have an issue I can easily fix I'll let you know how to fix it, but I won't actively develop any of these classes anymore. The public class I am most likely to care about right now is [https://github.com/chennisden/bounce](bounce), so I would recommend you use that instead.

Unless you have a really good reason not to, I recommend using `bounce.cls` instead.

## Classes

Currently they have no documentation, sorry; they're just sort of there as historical artefacts. I think they look pretty good, but most of my math writing is now for Math Advance and I'm using our inhouse classes, so I don't really use any of these often anymore.

These are the relevant classes; many will be moved.

- dennis.cls
- lucky.cls
- shooting.cls
- nature.cls

## Dependencies

I have a couple of dependencies with personal formatting options I like. I load some math operators in `mathOperators.sty`, I create TikZ Macros to make my life easier when constructing diagrams in `tikzMacros.sty`, and I store some fonts I frequently use in commands of `fonts.sty`. I package them all together in `universal.sty`.

The package `chessBM.sty` is some chess black magic I copied from Stack Exchange. Through adjustboxes, it makes the chess symbols look good inline. (I use this for the problem symbols in several classes.)

I'll also probably be moving a number of my general utility packages to CTAN. You'll want to run

    tlmgr install [package]

if LaTeX tells you it can't find any package. (You will want `ifallfalse`, `macrolist`, `palette`, and `scrambledenvs`.) **You need TeX Live 2021 for this**; manually install if you really don't want to upgrade.

# Legacy/deprecated styles

`hintsol.sty` and its relatives `printhint.tex` and `printsol.tex` are totally worthless now. I copied Evan Chen who copied a Stack Exchange post, so it also happens to be really poorly written since this was at least 3rd degree copying. Use [https://github.com/chennisden/scrambledenvs](scrambledenvs) instead.

`team.sty` is a variation of `dennis.cls` (back when it was still a sty file). We made most of the `team.sty` changes _in_ `dennis.cls`, so there is no reason to care about it (other than exercisebox by Amol Rama). It was used for MAC's 2020 Summer AMC course and has not been used since.
