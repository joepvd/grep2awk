# grep2awk's autoconfiguration for antigen/oh-my-zsh users.
# Overwrite the default key binding by setting
# GREP2AWK_KEY in your init script.

autoload -Uz grep2awk
zle -N grep2awk
bindkey ${GREP2AWK_KEY:-\^X\^A} grep2awk
