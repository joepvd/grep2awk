# This to quickly set up the console for developing/testing 
# grep2awk. Make sure this file is in the same directory as grep2awk
# and source it. zle will be set up.


fpath=( $fpath[@] . )

unfunction grep2awk 2>/dev/null
autoload grep2awk
zle -N grep2awk
bindkey '\C-p' grep2awk


