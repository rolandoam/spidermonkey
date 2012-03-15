# What is this?

The [SpiderMonkey](https://developer.mozilla.org/En/SpiderMonkey/) JavaScript VM for iOS

# How to make it work

First, you need Xcode >= 4.3.1. After that, you need autoconf213 (I recommend macports), then it's easy:

    git clone git://github.com/funkaster/spidermonkey.git
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

Enjoy!