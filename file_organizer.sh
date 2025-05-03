#! /bin/bash
isfilePicture(){
    isfileAPicture=1
    for str in ${picturesFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileAPicture=0
        fi
    done
    if [[ isfileAPicture -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileMusic(){
    isfileAMusic=1
    for str in ${musicFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileAMusic=0
        fi
    done
    if [[ isfileAMusic -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileVideo(){
    isfileAVideo=1
    for str in ${videoFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileAVideo=0
        fi
    done
    if [[ isfileAVideo -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileCode(){
    isfilecode=1
    for str in ${codeFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfilecode=0
        fi
    done
    if [[ isfilecode -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileOffice(){
    isfileOffice=1
    for str in ${officeFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileOffice=0
        fi
    done
    if [[ isfileOffice -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileArchive(){
    isfileArchive=1
    for str in ${archiveFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileArchive=0
        fi
    done
    if [[ isfileArchive -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}
isfileText(){
    isfileText=1
    for str in ${textFileExtensions[@]}; do
        if [[ $1 =~ \.${str}$ ]]; then
            isfileText=0
        fi
    done
    if [[ isfileText -eq 0 ]]; then
        return 0
    else 
        return 5
    fi
}

cd ~/Downloads
picturesFileExtensions=("jpg" "png" "webp" "gif" "tif" "bmp" "eps" "svg")
musicFileExtensions=("mp3" "wma" "snd" "wav" "ra" "m4a" "au" "aac" "flac")
videoFileExtensions=("mp4" "avi" "mpg" "mov" "wmv")
codeFileExtensions=("py" "js" "html" "css" "cpp" "java" "c" "cs" "swift" "pl" "bat" "exe" "com" "sh" "rb" "ts" "json" "xml" "yml")
officeFileExtensions=("doc" "docx" "pptx" "xlsx" "msg")
archiveFileExtensions=("ar" "iso" "tar" "bz2" "gz" "rz" "sz" "zip" "xz" "apk" "dmg" "jar" "rar" "deb")
textFileExtensions=("txt" "pdf" "rtf")

for FILE in *; do
if [[ ! -d $FILE ]]; then
        isfilePicture $FILE
        pictureReturnCode=$?
        isfileMusic $FILE
        musicReturnCode=$?
        isfileVideo $FILE
        videoReturnCode=$?
    if [[ $pictureReturnCode -eq 0 ]];then
        mv ./$FILE ../Pictures
        echo "$FILE sent to Pictures"
    elif [[ $musicReturnCode -eq 0 ]];then
        mv ./$FILE ../Music
        echo "$FILE sent to Music"
    elif [[ $videoReturnCode -eq 0 ]]; then
        mv ./$FILE ../Videos
        echo "$FILE sent to Videos"
    else
        mv ./$FILE ../Documents
    fi
fi
done

cd ../Documents
if [[ ! -e ./Code_and_Executables ]]; then
mkdir Code_and_Executables
fi
if [[ ! -e ./Office_Docs ]]; then
mkdir Office_Docs
fi
if [[ ! -e ./Archives ]]; then
mkdir Archives
fi
if [[ ! -e ./Miscellaneous ]]; then
mkdir Miscellaneous
fi
if [[ ! -e ./Text_Files ]]; then
mkdir Text_Files
fi
for FILE in *; do
if [[ ! -d $FILE ]]; then
    isfileCode $FILE
    codeReturnCode=$?
    isfileOffice $FILE
    officeReturnCode=$?
    isfileArchive $FILE
    archiveReturnCode=$?
    isfileText $FILE
    textReturnCode=$?
    if [[ $codeReturnCode -eq 0 ]];then
        mv ./$FILE ./Code_and_Executables
        echo "$FILE sent to Code_and_Executables"
    elif [[ $officeReturnCode -eq 0 ]];then
        mv ./$FILE ./Office_Docs
        echo "$FILE sent to Office_Docs"
    elif [[ $archiveReturnCode -eq 0 ]]; then
        mv ./$FILE ./Archives
        echo "$FILE sent to Archives"
    elif [[ $textReturnCode -eq 0 ]]; then
        mv ./$FILE ./Text_Files
        echo "$FILE sent to Text_Files"
    else
        mv ./$FILE ./Miscellaneous
        echo "$FILE sent to Miscellaneous"
    fi
fi
done

