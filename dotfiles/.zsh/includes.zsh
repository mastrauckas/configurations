if [ -f ~/z/z.sh ]; then
   . ~/z/z.sh
fi

if [ -f /usr/local/etc/profile.d/z.sh ]; then
   . /usr/local/etc/profile.d/z.sh
fi

if [ -f /usr/local/bin/kubectl ]; then
   source <(kubectl completion zsh)  # setup autocomplete in zsh
fi


