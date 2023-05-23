# random-utilities
A series of sparse utilities that might come in handy during my projects, the idea would be the following
```
git clone git@github.com:S3gmentati0nFault/random-utilities.git
```
thus you will gain access to all the utilities I am currently using (this is cl so I'm going to ignore, by design, Windows Os).


Once you have cloned this you can call all the functions I have defined in my utilities.sh file, in particular the `utilsDownload` procedure, which 
downloads the utilities present in this repository tailored for a specific programming language (for example Java).


Before doing that though you should include the file containing these functions in your `.bashrc` or `.zshrc` file by
```
source #path you put the repository in#/random-utilities/bash/utilities.sh
```


Once you have done that you will have access to the functions I have wrote for importing utilities into your projects.


A little change has been made because I moved from an `ssh-agent` config to a `.ssh/config` configuration. If you have it you have to change all of the instances in `utilities.sh` of `gh` with the name of your configuration.
If you are running on a ssh-agent configuration you have two different choices:

## Keep on using ssh-agent
If you want to keep using the ssh-agent you should go into `radnom-utilities/bash/utilities.sh` and modify the ssh links for github with `git@github.com` instead of the `gh` shortcut.


## Move to a config system
The easiest way is to use a config system, the fastest solution is the following:
1. Move your keys into the .ssh folder
2. Go in the .ssh folder and create a new file called config
3. Modify the config file as follows:
```
Host hostname #you can invent this one# github.com
  User git
  Hostname github.com
  IdentityFile .ssh/#name of your public key#
```
4. Modify my code in the folder `random-utilities/bash/utilities.sh`, every time that git servers are polled you can either use `hostname:...` or `git@github.com:...`.

Creating such file will allow you to access github by doing the following (as an example)
```
git clone gh:username/myrepo.git
```
instead of having to go through the ssh-agent every time like so
```
git clone git@github.com:username/myrepo.git
```



Whenever you use utilsDownload it will download this repository to your local machine in the project folder (it should be launched from the root folder of your project), and then
it will delete anything that is of no use (like the `.git` folder and utilities for other programming languages).


As of right now it's meant to work only with Java and IntelliJ, but if my development scenario happens to change so will the download routine.
