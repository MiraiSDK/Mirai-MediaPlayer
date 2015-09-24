#!/bin/bash

checkError()
{
    if [ "${1}" -ne "0" ]; then
        echo "*** Error: ${2}"
        exit ${1}
    fi
}

if [ ! -f $MIRAI_SDK_PREFIX/lib/libMediaPlayer.so ] || 
	[ "$OPTION_REBUILD_COCOA" == "yes" ]; then
	pushd $MIRAI_PROJECT_ROOT_PATH/Mirai-MediaPlayer
	xcodebuild -target MediaPlayer-Android -xcconfig xcconfig/Android-$ABI.xcconfig clean
	
	xcodebuild -target MediaPlayer-Android -xcconfig xcconfig/Android-$ABI.xcconfig
	checkError $? "build MediaPlayer failed"
	
	#clean up
	rm -r build
	popd
fi