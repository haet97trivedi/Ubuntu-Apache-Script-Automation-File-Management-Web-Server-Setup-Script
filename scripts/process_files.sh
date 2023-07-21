
# Unsorted_files unzipping

echo "Unzipping files..."
unzip -q un_sorted_files.zip

echo "Files unzipped..."

# Create misc directory
mkdir "misc"
# Create sortfile
touch misc/sortfile.txt

echo "Misc directory created"

# Read arguments and convert into lowercase
arg1=${1,,}
arg2=${2,,}
arg3=${3,,}

echo "Arguments are $arg1, $arg2, $arg3"

FILE_DIRCTRY="./un_sorted_files"


# Create directories based on argument arg1
if [ $arg1 == jpeg ]  ||  [ $arg1 == jpg ]; then
  mkdir "jpg"
  touch jpg/sortfile.txt
  file1=jpg
elif [ $arg1 == doc ]  ||  [ $arg1 == docx ]; then
  mkdir "docx"
  touch docx/sortfile.txt
  file1=docx
else
  mkdir "$arg1"
  touch $arg1/sortfile.txt
  file1=$arg1
fi

# Create directories based on argument arg2
if [ $arg2 == jpeg ]  ||  [ $arg2 == jpg ]; then
  mkdir "jpg"
  touch jpg/sortfile.txt
  file2=jpg
elif [ $arg2 == doc ]  || [ $arg2 == docx ]; then
  mkdir "docx"
  touch docx/sortfile.txt
  file2=docx
else
  mkdir "$arg2"
  touch $arg2/sortfile.txt
  file2=$arg2
fi

# Create directories based on argument arg3
if [ $arg3 == jpeg ]  ||  [ $arg3 == jpg ]; then
  mkdir "jpg"
  touch jpg/sortfile.txt
  file3=jpg
elif [ $arg3 == doc ]  || [ $arg3 == docx ]; then
  mkdir "docx"
  touch docx/sortfile.txt
  file3=docx
else 
  mkdir "$arg3"
  touch $arg3/sortfile.txt
  file3=$arg3
fi

echo "Argument directories created"

# Loop through each file in file directory
for file in $FILE_DIRCTRY/*; do
  	
  	# Convert file to lowercase
  	file_lower=${file,,}

	# Check file type of argument and copy file into respective folder - arg1
	if [[ $arg1 == jpeg || $arg1 == jpg ]]; then
	   if [[ $file_lower == *.jpeg || $file_lower == *.jpg ]]; then
	       cp "$file" ./jpg
	   fi
	    
	elif [[  $arg1 == doc || $arg1 == docx ]]; then
	   if [[ $file_lower == *.docx || $file_lower == *.doc ]]; then
	       cp "$file" ./docx
	   fi
	   
	elif [[ $file_lower == *.$arg1 ]]; then
	   cp "$file" ./$arg1
	fi 


	# Check file type of argument and copy file into respective folder - arg2
	if [[ $arg2 == jpeg || $arg2 == jpg ]]; then
	   if [[ $file_lower == *.jpeg || $file_lower == *.jpg ]]; then
	       cp "$file" ./jpg
	   fi
	elif [[ $arg2 == doc || $arg2 == docx ]]; then
	   if [[ $file_lower == *.docx || $file_lower == *.doc ]]; then
	       cp "$file" ./docx
	   fi
	   elif [[ $file_lower == *.$arg2 ]]; then
	       cp "$file" ./$arg2
	   fi

	# Check file type of argument and copy file into respective folder - arg3
	if [[  $arg3 == jpeg || $arg3 == jpg ]]; then
	   if [[ $file_lower == *.jpeg || $file_lower == *.jpg ]]; then
	       cp "$file" ./jpg
	   fi
	 
	elif [[ $arg3 == doc || $arg3 == docx ]]; then
	   if [[ $file_lower == *.docx || $file_lower == *.doc ]]; then
	       cp "$file" ./docx  
	   fi
	   elif [[ $file_lower == *.$arg3 ]]; then
	       cp "$file" ./$arg3
	   fi

	# Check file type of argument and copy file into respective folder - misc
	if [[ $arg1 == jpg || $arg1 == jpeg || $arg1 == doc || $arg1 == docx ]];then

	   if ! [[ $file_lower == *.$arg1 || $file_lower == *.$arg2 || $file_lower == *.$arg3 || $file_lower == *.jpg || $file_lower == *.jpeg || $file_lower == *.doc || $file_lower == *.docx ]]; then
	      cp "$file" ./misc
	   fi

	elif [[ $arg2 == jpg || $arg2 == jpeg || $arg2 == doc || $arg2 == docx ]];then

	   if ! [[ $file_lower == *.$arg1 || $file_lower == *.$arg2 || $file_lower == *.$arg3 || $file_lower == *.jpg || $file_lower == *.jpeg || $file_lower == *.doc || $file_lower == *.docx ]]; then
	      cp "$file" ./misc
	   fi

	elif [[ $arg3 == jpg || $arg3 == jpeg || $arg3 == doc || $arg3 == docx ]];then

	   if ! [[ $file_lower == *.$arg1 || $file_lower == *.$arg2 || $file_lower == *.$arg3 || $file_lower == *.jpg || $file_lower == *.jpeg || $file_lower == *.doc || $file_lower == *.docx ]]; then
	      cp "$file" ./misc
	   fi

	elif ! [[ $file_lower == *.$arg1 || $file_lower == *.$arg2 || $file_lower == *.$arg3  ]]; then
	      cp "$file" ./misc

	 fi

done
# End loop

echo "Files sorted into directories"


# Create summary.txt file
touch summary.txt

# Insert into summary.txt file sorted alphabetically descending
echo "....These are the $file1 files...." >> summary.txt
echo "" >> summary.txt
ls -lr $file1/ | awk '{print substr($0, index($0, $9))}' >> summary.txt
echo "" >> summary.txt
echo "" >> summary.txt


echo "....All the $file2 files...." >> summary.txt
echo "" >> summary.txt
ls -lr $file2/ | awk '{print substr($0, index($0, $9))}' >> summary.txt
echo "" >> summary.txt
echo "" >> summary.txt


echo "....all the $file3 files...." >> summary.txt
echo "" >> summary.txt
ls -lr $file3/ | awk '{print substr($0, index($0, $9))}' >> summary.txt
echo "" >> summary.txt
echo "" >> summary.txt


echo "....These are the misc files...." >> summary.txt
echo "" >> summary.txt
ls -lr misc/ | awk '{print substr($0, index($0, $9))}' >> summary.txt
echo "" >> summary.txt
echo "" >> summary.txt

echo "Summary.txt file created"


# Use stringedit to remove sorted and total irrelevant words from file

sed -i '/sortfile/d' ./summary.txt
sed -i '/total /d' ./summary.txt


# Sort file by size descending and write into sortfile 

ls -lSr $file1/ > $file1/sortfile.txt
ls -lSr $file2/ > $file2/sortfile.txt
ls -lSr $file3/ > $file3/sortfile.txt
ls -lSr misc/ > misc/sortfile.txt

# Use stringedit to remove sorted and total irrelevant words from file

sed -i '/total /d' $file1/sortfile.txt
sed -i '/sortfile/d' $file1/sortfile.txt
sed -i '/total /d' $file2/sortfile.txt
sed -i '/sortfile/d' $file2/sortfile.txt
sed -i '/total /d' $file3/sortfile.txt
sed -i '/sortfile/d' $file3/sortfile.txt
sed -i '/total /d' misc/sortfile.txt
sed -i '/sortfile/d' misc/sortfile.txt


###################### 1. Personal Reflection ###########################

# This script utilized the power of if-else conditionals, for loops, variables and unix commands such as awk and sed to
# execute the problem statement. This bash script unzips the provided folder, creates directories based on the command line arguments, 
# and sorts the files in the original directory into their respective created folders. Based on the file type in the command line
# args, the conditionals check for the doc/docx and jpg/jpeg conflict presence and is succesfully able to combine both file types
# into a single directory. It uses awk and sed to sort, filter and write the output into relevant sortfiles and summary files in each directory. 

###################### 2. My Approach ###########################

# I approached the problem statement in a modular manner. I subdivided the problem statement into sequential steps such as inserting creating relevant 
# directories based on filetypes and inserting sortfiles consecutively, clearing up unwanted texts from sorted files after sorting etc. To carry out my plan, 
# I jotted down the loops and conditional expressions required to succesfully segregate the files into their directories. Due to presence of uppercase files 
# and doc/docx and jpg/jpeg files, I wrote down lowercase and nested conditional statements to handle such cases. I considered using the awk and tools to sort 
# the output and write the resulting lists into the appropriate files. 

###################### 1. My Learnings ###########################

# My learnings from this assignment was manifold. My main learning from this exercise on a high level was on how to structuring, syntaxing 
# and manipulating files by using bash scripting. I also learnt how to use a variety of commands such as awk, sed, cp, if-else and also how to 
# utilize the power of variables. I learnt how to sort files based on size or alphabetical order and also sed for manipulating strings within files.

###################### 4. Future Approaches ###########################

# From my learnings in this assignment, I learnt that I can use modularization and utilize a variety of unix commands in order to solve the given problem statement.
# I also will be structuring my approach and writing pseudocode to outline my approach before starting with scripting. I'll also use the power of functions to make
# my code more functionals and modular.


