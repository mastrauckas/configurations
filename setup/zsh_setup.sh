ohMyZshDirectory=~/oh-my-zsh


echo Directory where confiration files are?
read confirationDirectory
echo Are you sure you want to use directory \"$confirationDirectory\"? 
echo y for yes and n for no.
read answer
if [ $answer == 'y' ] ; then
       echo Wil now use  \"$confirationDirectory\" as confiration directory
       if [ -d "$confirationDirectory" ]; then
            #[ -f $file ] && [ ! -L $file ] && echo "$file exists and is not a symlink"
            # git@github.com:robbyrussell/oh-my-zsh.git
            if [ -d "$ohMyZshDirectory" ]; then
                if  which git > /dev/null;  then
                    echo git exits right now.
                else
                    echo git does not exist so can not get  \"oh-my-zsh \" from github.
                fi
            else
                echo oh-my-zsh already installed.
            fi
       else
            echo Error:  Directory  \"$confirationDirectory\" does not exists.  
            echo Please start over with a directory that exists.
       fi
else
   echo Please start over with the correct confiration file
fi