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
