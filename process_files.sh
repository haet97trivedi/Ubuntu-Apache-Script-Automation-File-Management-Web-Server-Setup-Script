#unzip un_sorted_files.zip

FILE_DIR="./un_sorted_files"

frst_arglw=${1,,}
scnd_arglw=${2,,}
thrd_arglw=${3,,}

mkdir misc
touch misc/sorted.txt

if [ $frst_arglw == jpeg ]  ||  [ $frst_arglw == jpg ]
then
	mkdir jpg
	touch jpg/sorted.txt
	file1=jpg

elif [ $frst_arglw == doc ]  ||  [ $frst_arglw == docx ]
then
echo "inside doc"
       mkdir docx
       touch docx/sorted.txt
       file1=docx
else
echo "inside else" 
       mkdir $frst_arglw
       touch $frst_arglw/sorted.txt
       file1=$frst_arglw
fi

if [ $scnd_arglw == jpeg ]  ||  [ $scnd_arglw == jpg ]
then
	echo "inside jpg 2"
	mkdir jpg
	touch jpg/sorted.txt
	file2=jpg
	
elif [ $scnd_arglw == doc ]  || [ $scnd_arglw == docx ]
then
       echo "inside doc 2"
       mkdir docx
       touch docx/sorted.txt
       file2=docx

else 
       echo "inside else 2"
       mkdir $scnd_arglw
       touch $scnd_arglw/sorted.txt
       file2=$scnd_arglw
fi


if [ $thrd_arglw == jpeg ]  ||  [ $thrd_arglw == jpg ]
then
	echo "inside jpg 3"
	mkdir jpg
	touch jpg/sorted.txt
	file3=jpg
	
elif [ $thrd_arglw == doc ]  || [ $thrd_arglw == docx ]
then
       echo "inside doc3"
       mkdir docx
       touch docx/sorted.txt
       file3=docx
else 
       echo "inside else3"
       mkdir $thrd_arglw
       touch $thrd_arglw/sorted.txt
       file3=$thrd_arglw

fi

## 1st arg check
for file in $FILE_DIR/*; do

  filelw=${file,,}


if [[ $frst_arglw == jpeg || $frst_arglw == jpg ]]; then
   echo $file
   if [[ $filelw == *.jpeg || $filelw == *.jpg ]]; then
       cp "$file" ./jpg
       echo "jpg 11 "
   fi
    
elif [[  $frst_arglw == doc || $frst_arglw == docx ]]; then
   if [[ $filelw == *.docx || $filelw == *.doc ]]; then
       cp "$file" ./docx
       echo "jpg 12 "
   fi
   
elif [[ $filelw == *.$frst_arglw ]]; then
   cp "$file" ./$frst_arglw
   echo "jpg 13 "
fi 


## 2nd Arg check

if [[ $scnd_arglw == jpeg || $scnd_arglw == jpg ]]; then
#    echo $file
   if [[ $filelw == *.jpeg || $filelw == *.jpg ]]; then
       cp "$file" ./jpg
       echo "jpg 21"
   fi

elif [[ $scnd_arglw == doc || $scnd_arglw == docx ]]; then

   if [[ $filelw == *.docx || $filelw == *.doc ]]; then
       cp "$file" ./docx
       echo "jpg 22"
   fi

   elif [[ $filelw == *.$scnd_arglw ]]; then
       cp "$file" ./$scnd_arglw
       echo "jpg 23"

fi


## 3rd arg check

if [[  $thrd_arglw == jpeg || $thrd_arglw == jpg ]]; then
 #   echo $file
   if [[ $filelw == *.jpeg || $filelw == *.jpg ]]; then
       cp "$file" ./jpg
       echo "jpg 31 "
   fi
 
elif [[ $thrd_arglw == doc || $thrd_arglw == docx ]]; then
   if [[ $filelw == *.docx || $filelw == *.doc ]]; then
       cp "$file" ./docx
       echo "jpg 32 $file"
       
   fi

   elif [[ $filelw == *.$thrd_arglw ]]; then
       cp "$file" ./$thrd_arglw
       echo "jpg 33 $file"

fi

## Else
if [[ $frst_arglw == jpg || $frst_arglw == jpeg || $frst_arglw == doc || $frst_arglw == docx ]];then

   if ! [[ $filelw == *.$frst_arglw || $filelw == *.$scnd_arglw || $filelw == *.$thrd_arglw || $filelw == *.jpg || $filelw == *.jpeg || $filelw == *.doc || $filelw == *.docx ]]; then
      cp "$file" ./misc
      echo "jpg 01 "
   fi

elif [[ $scnd_arglw == jpg || $scnd_arglw == jpeg || $scnd_arglw == doc || $scnd_arglw == docx ]];then

   if ! [[ $filelw == *.$frst_arglw || $filelw == *.$scnd_arglw || $filelw == *.$thrd_arglw || $filelw == *.jpg || $filelw == *.jpeg || $filelw == *.doc || $filelw == *.docx ]]; then
      cp "$file" ./misc
      echo "jpg 02 "
   fi

elif [[ $thrd_arglw == jpg || $thrd_arglw == jpeg || $thrd_arglw == doc || $thrd_arglw == docx ]];then

   if ! [[ $filelw == *.$frst_arglw || $filelw == *.$scnd_arglw || $filelw == *.$thrd_arglw || $filelw == *.jpg || $filelw == *.jpeg || $filelw == *.doc || $filelw == *.docx ]]; then
      cp "$file" ./misc
      echo "jpg 03 "
   fi

elif ! [[ $filelw == *.$frst_arglw || $filelw == *.$scnd_arglw || $filelw == *.$thrd_arglw  ]]; then
      cp "$file" ./misc
      echo "jpg 04"

 fi

done

## Main directory file
touch summary.txt

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


sed -i '/sorted/d' ./summary.txt
sed -i '/total /d' ./summary.txt

## Sorting

ls -lSr $file1/ | awk '{print substr($0, index($0, $9))}' > $file1/sorted.txt
ls -lSr $file2/ | awk '{print substr($0, index($0, $9))}' > $file2/sorted.txt
ls -lSr $file3/ | awk '{print substr($0, index($0, $9))}' > $file3/sorted.txt
ls -lSr misc/ | awk '{print substr($0, index($0, $9))}' > misc/sorted.txt

sed -i '/total /d' $file1/sorted.txt
sed -i '/sorted/d' $file1/sorted.txt
sed -i '/total /d' $file2/sorted.txt
sed -i '/sorted/d' $file2/sorted.txt
sed -i '/total /d' $file3/sorted.txt
sed -i '/sorted/d' $file3/sorted.txt
sed -i '/total /d' misc/sorted.txt
sed -i '/sorted/d' misc/sorted.txt


