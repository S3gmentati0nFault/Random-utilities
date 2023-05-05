# !/bin/bash

mqttStartup(){
   /usr/local/opt/mosquitto/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf
}

javaCompile(){
   javac $1.java
   java $1
   rm $1.class
}

utilsDownload(){
   if [ -d "./src/main/java/extra" ]; then
      rm -dr ./src/main/java/extra
   fi

   cd ./src/main/java/
   git clone git@github.com:S3gmentati0nFault/random-utilities.git
   sudo rm -dr ./random-utilities/.git
   mv ./random-utilities/$1/extra ./extra
   sudo rm -dr ./random-utilities
}

figlet-call(){
	OUTPUT=$(figlet -f slant -w 120 $1 | toilet -f term --gay -w 120)
	echo $OUTPUT | pv -l -q -L 5
	echo
}

gitTester(){
	ssh -T git@github.com
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
