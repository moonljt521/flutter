#!/bin/bash
# This is flutter build

# 初始化记录项目pwd
projectDir=`pwd`
# 获取 flutter sdk
rootFlutter=`which flutter`
# 提取 flutter skd路径
rootDir=${rootFlutter%/*}
# 获取

# step1 clean
echo 'clean old build'
find . -depth -name "build" | xargs rm -rf
${rootFlutter} clean


# step2 copy so
echo 'copy so'
cd ${rootDir}/cache/artifacts/engine
for arch in android-arm android-arm-profile android-arm-release ; do
    pushd $arch
    cp flutter.jar flutter-armeabi-v7a.jar #备份
    unzip flutter.jar lib/armeabi-v7a/libflutter.so
    mv lib/armeabi-v7a lib/armeabi
    zip -d flutter.jar lib/armeabi-v7a/libflutter.so
    zip flutter.jar lib/armeabi/libflutter.so
    popd
done

# step3 package get
echo 'packages get'
cd ${projectDir} # 回到项目
${rootFlutter} packages get

# step3.1  因为.android是自动编译的，所以内部的配置文件和脚本不可控，所以需要将bak内的脚本自动复制到 .android 内部
echo 'copy bak/config/uploadArchives.gradle to .android/config/... ,    copy bak/gradle.properties to Flutter/gradle.properties'
if [  -d '.android/config/' ]; then
   echo '.android/config 文件夹已存在'
else :
   mkdir .android/config
fi

if [  -f '.android/config/uploadAndroidJar.gradle' ];then
   echo '.android/config/uploadAndroidJar.gradle 已存在'
else :
   cp bak/config/uploadAndroidJar.gradle .android/config/uploadAndroidJar.gradle
fi

if [  -f "android/config/uploadArchives.gradle" ];then
    echo '.android/config/uploadArchives.gradle 已存在'
else :
    cp bak/config/uploadArchives.gradle .android/config/uploadArchives.gradle
fi

if [  -f ".android/Flutter/gradle.properties" ];then
    echo '.android/Flutter/gradle.properties 已存在'
else :
    cp bak/gradle.properties .android/Flutter/gradle.properties
fi

# step3.2  同时在Flutter 的gradle中插入引用  apply from: "../uploadArchives.gradle"
echo '在Flutter 的gradle中插入引用  apply from: "../uploadArchives.gradle"'
if [ `grep -c 'uploadArchives.gradle' .android/Flutter/build.gradle` -eq '1' ]; then
    echo "Found!"
else
    echo "not found , 去修改"
    sed -i '' '2i\
    apply from: "../config/uploadArchives.gradle"' .android/Flutter/build.gradle
fi

# step4 build
echo 'build apk'
${rootFlutter} build apk

# step4 unzip apk
echo 'unzip apk'
cd ${projectDir}/build/host
mkdir apkfile
unzip ${projectDir}/build/host/outputs/apk/release/app-release.apk -d ${projectDir}/build/host/apkfile/

# step4 copy assets / lib
echo 'copy assets / lib'
mv ${projectDir}/build/host/apkfile/assets/ ${projectDir}/.android/Flutter/src/main/
mv ${projectDir}/build/host/apkfile/lib/ ${projectDir}/.android/Flutter/src/main/

# step5 build aar
echo 'build aar'
cd ${projectDir}/.android
gradle clean flutter:assembleRelease uploadArchives --info

# step6 remove assets/lib
echo 'remove assets/lib'
cd ${projectDir}/.android/Flutter/src/main/
rm -rf assets
rm -rf lib

echo '打包成功..........................'
exit