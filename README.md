android_device_huawei_u8650
===========================

Android device configuration for Huawei C8650 handheld


Preparations
--
In order to build Cyanogenmod, we must first have 'repo' installed. To install repo, do the following commands:

$ mkdir -p ~/bin ~/android/system
$ PATH=~/bin:$PATH
$ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
$ chmod a+x ~/bin/repo

Initialize Repository
--
Change to the working directory (referred to as $CM by more experienced developers)
In this case, the working directory is ~/android/system. You can change this to whatever you feel like, but for now let's leave it as-is.

$ cd ~/android/system/

...And then initialize the repository.

$ repo init -u git://github.com/alfonsojon/android.git -b gingerbread
$ repo sync -j16

This is going to take a long time, as it has to fetch around 12 GB of files.

Extract necessary files from phone
--
Unfortunately Huawei cannot provide the full source for everything on the phone. This is okay. Just plug in your device, make sure ADB is enabled, and then run the following commands.

$ cd ~/android/system/device/huawei/ascend2/
$ ./extract-files.sh adb

Get Koush's RomManager
--
Don't skip this step, it's critical in the build process.
Run the following command to fetch Koush's RomManager.

$ ~/android/system/vendor/cyanogen/get-rommanager

Compile Cyanogenmod 7.2
--
Once that has finished, we're ready to begin the compilation process. Make sure to have the 10.04-11.10 packages installed as compilation fails using the 12.04 libraries. You cannot use Oracle JDK/OpenJDK 7 to build Cyanogenmod. You must use either Oracle JDK 6 or OpenJDK 6. Using OpenJDK 6 works, but I suggest using the Oracle JDK to prevent potential issues.

It's finally time to compile it. Run the following commands to compile Cyanogenmod 7.2 for the Huawei Sonic U8650..

$ cd ~/android/system
$ . build/envsetup.sh && brunch ascend2
