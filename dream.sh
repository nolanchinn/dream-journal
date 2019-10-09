#!/bin/bash
# Written by Nolan Chinn

# Date Format:
## 2019-09-29

# save today's date into a file
DT_FILE=$HOME/.dreams/.date
date +"%Y-%m-%d"> $DT_FILE

# get each component of the date
YEAR=`cat $DT_FILE | sed -E 's/-.*//g'`
MONTH=`cat $DT_FILE | sed -E 's/[0-9]+-//' | sed -E 's/-.*//g'`
DAY=`cat $DT_FILE | sed -E 's/[0-9]+-[0-9]+-//g'`

# create the filename we'll either edit or create
FILENAME=$YEAR-$MONTH-$DAY

# create year dir if necessary
if [ ! -d "$HOME/.dreams/$YEAR" ]
then
	mkdir $HOME/.dreams/$YEAR
fi

# create month dir if necessary
if [ ! -d "$HOME/.dreams/$YEAR/$MONTH" ]
then
	mkdir $HOME/.dreams/$YEAR/$MONTH
fi


# if the file doesn't already exist, create it
FILE=$HOME/.dreams/$YEAR/$MONTH/$FILENAME
if [ ! -f $FILE ]
then
	touch $FILE
fi

# append current time and title space to file
TIME=`date +"%H:%M"`
echo "Time: $TIME" >> $FILE
echo "Title: " >> $FILE

#vim "+ normal G$" +startinsert $FILE
vim "+ normal G$"  $FILE

echo "-------------------------------------------------------------------------------" >> $FILE
