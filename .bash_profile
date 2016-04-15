if
 [ -f ~/.bashrc ]; then . ~/.bashrc;
fi
if
 [[ -f ~/.bashrc_mac && "$(uname)" == "Darwin" ]]; then . ~/.bashrc_mac;
fi 
