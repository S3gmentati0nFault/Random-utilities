# !bin/bash

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
   git clone gh:S3gmentati0nFault/random-utilities.git
   sudo rm -dr ./random-utilities/.git
   mv ./random-utilities/$1/extra ./extra
   sudo rm -dr ./random-utilities
}

pullAll(){
		ls -a
		setopt CSH_NULL_GLOB
		ARRAY=(*)

		for DIR in "${ARRAY[@]}" 
		do
				echo "\n\nPulling directory $DIR"
				cd $DIR
				git pull
				..
		done
}

figlet-call(){
	OUTPUT=$(figlet -f slant -w 120 $1 | toilet -f term --gay -w 120)
	echo $OUTPUT | pv -l -q -L 5
	echo
}

gitTester(){
	ssh -T gh
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

gitadd(){
		if test -n " $(find . -name \*.tex -type f) ";
		then
				cleaner
		fi
		COMMIT_TEXT=$1
		git status
		git add *
		git commit -m $COMMIT_TEXT
		git push
}