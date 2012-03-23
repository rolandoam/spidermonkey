#!/bin/sh

# configure
../configure --with-android-ndk=/opt/android/android-ndk \
             --with-android-sdk=/opt/android/android-sdk \
             --with-android-version=5 \
             --with-android-toolchain=/opt/android/android-ndk/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86 \
             --enable-application=mobile/android \
             --target=arm-linux-androideabi \
             --disable-shared-js \
             --disable-tests \
             --enable-strip \
             --enable-install-strip \
             --enable-debug \
             --disable-methodjit \
             --disable-monoic \
             --disable-polyic

# make
make -j4

# copy dist directory
cp -RL dist ../../..
