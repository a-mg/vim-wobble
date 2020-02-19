# vim-wobble
Text objects and tweaks for writing HTML/XML and CSS<br>
_wobble's **w**eb text **ob**jects **b**ring **l**ightness to your **e**diting_

![example of editing html with vim-wobble](/doc/example.gif)

---

## Introduction

wobble adds text objects and commands to help you write HTML/XML and CSS. It
expands on Vim's built-in objects to provide better mnemonics for common markup
syntax, such as HTML attributes and CSS selectors.

Here's an example. You want to change a div's class from `lorem ipsum` to
`column`. Before, you'd need to first move your cursor between the quotes with
`f"l`, then type `ci"`. wobble gives you an "inner class" motion that you can
invoke with your cursor anywhere in the line! Check it out:

```
.........................        <- cursor position
<div class="lorem ipsum">        <- buffer line
            └── ciC ──┘          <- motion target
```

## Text objects

wobble's text objects work just like the ones built into Vim. You can use them
to select text in visual mode, or as the targets of commands, like 'delete' and
'change'. (See `:help text-objects` to learn more.) The diagrams in this section
show all of wobble's objects, and demonstrate how they work.

### HTML/XML

Attributes:

```
    .........................
<div attr-lorem="ipsum dolor" class="sit-amet" id="consectetur">
    │├── iN ──┘  └── iV ───┤│
    │└──────── iA ──────────┤
    └───────── aA ──────────┘
```

Named attributes, and attribute lists:

```
................................................................
<div attr-lorem="ipsum dolor" class="sit-amet" id="consectetur">
    ││                       │       └─ iC ─┘││     └── iI ──┘│
    ││                       └───────── aC ──┘└──────── aI ───┤
    │└──────── iL ────────────────────────────────────────────┤
    └───────── aL ────────────────────────────────────────────┘
```

Comments:

```
...................................
<!-- lorem ipsum dolor sit amet -->
     └────────── ic ──────────┘
```

### CSS

Declarations:

```
........................
border: 10px solid blue;
├ iP ┘││└──── iV ─────┘│
└ aP ─┘└───── aV ──────┘
```

Units:

```
        ....
border: 10px solid blue;
          └┘ iU
```

Selectors:

```
.................................
a, a:hover, a:active, a:visited {
└──────────── iS ─────────────┘
```

## Installing

Use your favorite package manager, or use Vim's built-in package support:

```
cd $HOME/.vim/pack/default/start
git clone https://github.com/a-mg/vim-wobble
```

## More

For complete information about using, configuring, and contributing to wobble,
see `:help wobble`.
