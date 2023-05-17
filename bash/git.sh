git-add(){
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

git-test(){
	ssh -T gh
}

pull-all(){
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

git-clone(){
		URL="${1/git@github.com/gh}"
		
		git clone "$URL"
}
