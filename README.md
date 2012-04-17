# spidermonkey

The [SpiderMonkey](https://developer.mozilla.org/En/SpiderMonkey/) JavaScript VM buildable on Android and iOS.

## Demo

http://folecr.github.com/hellojs-android

## Build

#### Prerequisistes

##### All platforms

 * autoconf213

##### iOS

 * Xcode >= 4.3.1

##### Android

 * Android NDK

### How to

#### iOS

##### Precompiled version

* Download the [precompiled](https://github.com/downloads/funkaster/spidermonkey/spidermonkey-ios.zip) version
* Uncompress and place the files inside a 'libs' directory in your project (or anywhere you want)
* Add the proper header and libs search path to your target
* Also add the "-ljs_static" linker flag

##### Compile your own version

    cd spidermonkey/js/src
    autoconf213
    cd build-ios
    sh build_ios_fat.sh
    file libjs_static.a
    > libjs_static.a: Mach-O universal binary with 2 architectures
    > libjs_static.a (for architecture i386):	current ar archive random library
    > libjs_static.a (for architecture armv7):	current ar archive random library

After that you would get a fat (i386 + armv7) library named libjs_static.a and a directory named dist, full of symlinks. To use that you can just cp -RL the dist directory and place it wherever you want:

    cp -RL dist ~/Desktop/testmonkey/libs/spidermonkey

Then, in your iOS app, make sure you add the right header search path (libs/spidermonkey/include) and lib search path (libs/spidermonkey/libs) and add the linker flag "-ljs_static".

#### Android

    > mkdir mozilla && cd mozilla
    > git clone git://github.com/folecr/spidermonkey.git
    > cd spidermonkey/js/src
    > autoconf213
    > cd build-android
    > sh build.sh

Produces a static ARM library in 

    mozilla/spidermonkey/dist/lib

Include files are in 

    mozilla/spidermonkey/dist/include

Android NDK module is at

    mozilla/spidermonkey/android/Android.mk

You can now use this module in your Android NDK project by including this in your Application.mk

    $(call import-module,spidermonkey/android)

and adding the path to the mozilla directory to NDK_MODULE_PATH

    NDK_MODULE_PATH=mozilla

For an example application that will run JavaScript scripts on your Android device see http://folecr.github.com/hellojs-android.

Enjoy!

## Authors and contributors

 * @funkaster (iOS)
 * @folecr (Android)
 * The Mozilla SpiderMonkey team (duh)
