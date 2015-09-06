# Prezto init file for grep2awk
# By Joep van Delft, 2015
# https://github.com/joepvd/grep2awk

fpath=(${ZDOTDIR:-$HOME}/.zprezto/modules/grep2awk $fpath)
autoload -Uz grep2awk
zle -N grep2awk
bindkey ${GREP2AWK_KEY:-^X^A} grep2awk
