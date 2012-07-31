#!/bin/sh

MIN_IOS_VERSION=4.3
IOS_SDK=5.1

# create ios version
../configure --with-ios-target=iPhoneOS --with-ios-version=$IOS_SDK --with-ios-min-version=$MIN_IOS_VERSION --disable-shared-js --disable-tests
make -j4
if (( $? )) ; then
    echo "error when compiling iOS version of the library"
    exit
fi
mv libjs_static.a libjs_static.armv7.a

# remove everything but the static library and this script
ls | grep -v libjs_static.armv7.a | grep -v build_static_fat.sh | xargs rm -rf

# create i386 version (simulator)
../configure --with-ios-target=iPhoneSimulator --with-ios-version=$IOS_SDK --with-ios-min-version=$MIN_IOS_VERSION --disable-shared-js --disable-tests
make -j4
if (( $? )) ; then
    echo "error when compiling i386 (iOS Simulator) version of the library"
    exit
fi
mv libjs_static.a libjs_static.i386.a

if [ -e libjs_static.i386.a ]  && [ -e libjs_static.armv7.a ] ; then
    echo "creating fat version of the library"
    lipo -create -output libjs_static.a libjs_static.i386.a libjs_static.armv7.a
fi

echo "*** DONE ***"
echo "If you want to use spidermonkey, copy the 'dist' directory to some accesible place"
echo "e.g. 'cp -pr dist ~/path/to/your/project'"
echo "and then add the proper search paths for headers and libraries in your Xcode project"
