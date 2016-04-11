# !/usr/bin/python

from windows import *
import os

email = input('Please enter email address: ')
fullName = input('Please enter full name: ')

operatingSystem = None
if(os.name == 'nt'):
    print('Running under Windows.')
    operatingSystem = Windows()
else:
    print('Not windows')

operatingSystem.RemoveFiles()
print('Romved all files completed.')

operatingSystem.CreateSymbolicLinks()
print('Symbolic links created.')

operatingSystem.createGitConfig(email,fullName)
print('.gitconfig created.')
