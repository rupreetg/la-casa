
#!/bin/bash

################################################
#  Author: Rupreet Gujral [RG]                  #
#################################################


# 	Usage
#		git-init <repo-hint> <branch> <debug 0|1>


#if [$3 -eq "" ]; then
#	$3 = 0 #Set to non-debug mode
#fi

#Setting up variables...
BASE_PATH="d:/work/"
declare -A repos=( 
		["ea"]="SC.EA" 
		["approval"]="Approvals.Service"
	)
ALIAS=$(whoami)
BRANCH_NAME=dev/$ALIAS/$2
DEBUG=$3

if [ $DEBUG > 0 ]; then
	#ECHO ALL VARIABLES
	echo "Base Path" $BASE_PATH
	echo "Repo List" ${repos[@]}
	echo "user alias" $ALIAS
	echo "Branch Name" $BRANCH_NAME
fi

#check if the repo entered exist in our system else show error and exit
if [ "${repos[$1]}" == "" ]; then
	echo "no repo found with this name...exiting now..."
	exit
fi

cd $BASE_PATH #Change to code directory
cd ${repos[$1]}

if [ $DEBUG > 0 ]; then
	echo $(pwd)
fi

#Check if the current branch is master or not

CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
echo $CURRENT_BRANCH
if [ "$CURRENT_BRANCH"  != "master" ]; then
	#git stash
	git checkout master
fi

git pull origin master

EXISTING_BRANCHES=$(git branch | grep -w $BRANCH_NAME)

if [ $DEBUG > 0 ]; then
	echo "Existing Branches" $EXISTING_BRANCHES
fi

if [ -z $EXISTING_BRANCHES ] ; then
	#echo "Creating new branch and setting it's tracker " $BRANCH_NAME
	git branch $BRANCH_NAME
	git checkout $BRANCH_NAME
	#git push --set-upstream origin $BRANCH_NAME
	echo "Branch $BRANCH_NAME successfully created."
else
	echo "This is already a branch with this name: " $BRANCH_NAME
	git checkout $BRANCH_NAME
	exit
fi
