## Ian's Emacs Configuration

### Thanks for dropping by!
This is my personal Emacs configuration (on GNU Emacs 26.2). It's unopinionated and was created for general use in mind. I've documented, as detailed as possible, what **each code snippet does** in my `config.org` file.

This Emacs config starts up **super fast** with an average init time of 0.8 to 1.1 seconds.

### Installation
Back up your `~/.emacs.d/` first (if you have one):

```mv ~/.emacs.d/ ~/.emacs.d.bak/```

Git clone my configuration to your new `~/.emacs.d/` :

```git clone https://github.com/ianpan870102/.emacs.d.git ~/.emacs.d/```

### "Rolling" Release
I will constantly push new commits since *a real Emacser* is never completely satisfied with his/her setup.

### How the config structure works

My `init.el` requires `config.el`(produced by org-babel + `config.org`) and `custom.el`.

## Packages that I use:

#### Vim Editing habits (Optional depending on your preferences)
- evil

#### Git integration
- magit

#### Better Emacs defaults
- auto-indent-mode
- company (autocompletion)
- ido-vertical-mode
- smooth-scrolling
- whitespace-cleanup-mode

#### Org mode
- org-bullets

#### File management
- ranger

#### Web development
- rainbow-mode

#### Friendly warnings
- flycheck

#### Lightweight syntax highlight improvement for all languages
- highlight-operators
- highlight-numbers
- highlight-escape-sequences

## Appendix I: Themes I adore
- Spacemacs Dark & Light: https://github.com/nashamri/spacemacs-theme
- Gruvbox Dark: https://github.com/Greduan/emacs-theme-gruvbox
- Nord: https://github.com/arcticicestudio/nord-emacs
- Solarized Dark: https://github.com/bbatsov/solarized-emacs
- GitHub Default Theme
- Emacs Reverse Video Theme (emacs -r): https://github.com/syohex/emacs-reverse-theme
- Monochrome: https://github.com/fxn/monochrome-theme.el
- Monokai Pro (not the original Monokai)

## Appendix II: Fonts I adore
- Monaco (curvy, easy to read)
- Input Mono (most compliment; customizable, modern-looking and geeky)
- Source Code Pro (playful and modern-looking)
- Hack / Menlo / DejaVu Sans Mono family (default on lots of systems)
- Andale Mono (tall, narrow, elegant characters)

## FAQ:
#### Why does my font look wrong?
- You might not have the required fonts installed, feel free to install them or change the font settings to your own liking in `custom.el`