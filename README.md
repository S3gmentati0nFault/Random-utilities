# random-utilities
A series of sparse utilities that might come in handy during my projects, the idea would be the following
```
git clone git@github.com:S3gmentati0nFault/random-utilities.git
```
thus you will gain access to all the utilities I am currently using (this is cl so I'm going to ignore, by design, Windows Os).


Once you have cloned this you can call all the functions I have defined in my utilities.sh file, in particular the { code : utilsDownload } procedure, which 
downloads the utilities present in this repository tailored for a specific programming language (for example Java). In the near future I will add also some functions 
that I found myself using in cpp.
Before doing that though you should include the file containing these functions in your .bashrc or .zshrc file by
```
source #path you put the repository in#/random-utilities/bash/utilities.sh
```
Once you have done that you will have access to the functions I have wrote for importing utilities into your projects.
Whenever you use utilsDownload it will download this repository to your local machine in the project folder (it should be launched from the root folder of your project), and then
it will delete anything that is of no use (like the .git folder and utilities for other programming languages).
As of right now it's meant to work only with Java and IntelliJ, but if my development scenario happens to change so will the download routine.
