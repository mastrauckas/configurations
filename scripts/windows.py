import os
import getpass

class Windows:
    __home = os.getenv('HOME', None)

    def RemoveFiles(self):
        if(self.__home is None):
            raise ValueError('HOME environment variable not set.')
        else:
            d = self.__home + '\.bash'
            if(os.path.isdir(d)):
                os.rmdir(d)

            d = self.__home + '\.vim'
            if(os.path.isdir(d)):
                os.rmdir(d)

            f = self.__home + '\.bashrc'
            if(os.path.exists(f)):
                os.unlink(f)

            f = self.__home + '\.vimrc'
            if(os.path.exists(f)):
                os.unlink(f)

            f = self.__home + '\.gitconfig'
            if(os.path.exists(f)):
                os.remove(f)

            f = self.__home + '\setup.py'
            if(os.path.islink(f)):
                os.unlink(f)


    def CreateSymbolicLinks(self):
        source = os.path.abspath('..\dotfiles')
        os.symlink(source + '\.bash', self.__home + '\.bash')

        source = os.path.abspath('..\dotfiles')
        os.symlink(source + '\.vim', self.__home + '\.vim')

        source = os.path.abspath('..\dotfiles')
        os.symlink(source + '\.bashrc', self.__home + '\.bashrc')

        source = os.path.abspath('..\dotfiles')
        os.symlink(source + '\.vimrc', self.__home + '\.vimrc')

        os.symlink('.\setup.py', self.__home + '\setup.py')

    def createGitConfig(self, email, fullName):
        source = os.path.abspath('..\dotfiles')
        with open(source + '\.gitconfig') as gitConfig:
            configData=gitConfig.read() \
                .replace('<email>', email) \
                .replace('<fullname>', fullName) \
                .replace('<username>', getpass.getuser())
            with open(self.__home + '\.gitconfig', 'w') as saveGitConfig:
                saveGitConfig.write(configData)
