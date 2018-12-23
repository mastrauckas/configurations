1. Install XCode from Apple App Store.
2. Run Brew and get installation instructions [here](https://brew.sh/)
3. Run brew update.
4. Download & install git from brew.
5. Download & install zsh from brew.
6. Install Oh My zsh from [here](https://ohmyz.sh/)

-  If you need to change the default shell, run command
   `sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh`.
-  [Here](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e) is the instructions
   git clone configrations repository

7. Create symbolic links
   -  `ln -s ~/projects/configurations/dotfiles/.zsh ~/.zsh`
8. Make changes to .zshrc file

-  Change `ZSH_THEME="robbyrussell"` to `ZSH_THEME="streamland"`
-  Uncomment `COMPLETION_WAITING_DOTS` and set it to trueChange `ZSH_CUSTOM` to `ZSH_CUSTOM=/Users/<user>/projects/configurations/dotfiles/.zsh`
-  Set plugins to:

       	```

   plugins=(
   aws
   z
   encode64
     git
     osx
     yarn
     docker
     brew
     npm
   )
   ```

-  Set preferred editor for local and remote sessions to:

       		```
       		if [[ -n $SSH_CONNECTION ]]; then
       		    export EDITOR='codei'
       		else
       		    export EDITOR='codei'
       		fi
       		```

9. Copy .gitconfig to home directory and change name and email address.
