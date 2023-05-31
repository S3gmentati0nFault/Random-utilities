# !bin/bash

mqtt-startup(){
   /usr/local/opt/mosquitto/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf
}

java-compile(){
   javac $1.java
   java $1
   rm $1.class
}

utils-download(){
   if [ -d "./src/main/java/extra" ]; then
      rm -dr ./src/main/java/extra
   fi

   cd ./src/main/java/
   git clone gh:S3gmentati0nFault/Random-utilities.git
   sudo rm -dr ./Random-utilities/.git
   mv ./Random-utilities/$1/extra ./extra
   sudo rm -dr ./Random-utilities
}

figlet-call(){
	OUTPUT=$(figlet -f slant -w 120 $1 | toilet -f term --gay -w 120)
	echo $OUTPUT | pv -l -q -L 5
	echo
}

cleaner(){
	echo "Cleaning up after the mess you've done..."
	find . -name \*.aux -type f -delete
	find . -name \*.fls -type f -delete
	find . -name \*.log -type f -delete
	find . -name \*.out -type f -delete
	find . -name \*.toc -type f -delete
	find . -name \*.synctex -type f -delete
	find . -name \*.fdb_latexmk -type f -delete
}

# SSH startup
function ssh-startup(){
	sudo systemctl start sshd
	sudo systemctl status sshd
}
