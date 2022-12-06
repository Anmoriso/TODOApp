# TODOApp

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

First you must install Android Studio and Android SDK
```
brew install --cask android-studio
brew install --cask android-SDK
```

after that you have to install flutter
```
brew install --cask flutter
```

## Setup project
update your PATH variable to have flutter and Android sdk available. Adapt the ~/.zshrc, ~/.bashrc or ~/.profile file

```
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$HOME/{PATH_TO_FLUTTER_INSTALLATION}/flutter/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator"
```

Run `flutter doctor` to check, if all dependencies are in place to start a flutter app.

If there are only checks, everything is setup to develop with flutter


For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Problems
you might have a problem with cmdline.tools component is missing in the Android toolchain after trying flutter doctor.
This is fixed with going to the SDK Manager in Android Studio (Preferences -> Appearance & Behavior -> System Settings -> Android SDK)
and download and select under SDK Tools the Android SDK Command-line Tools

## Run Application via Terminal

after the setup, it should be possible to run the app with `flutter run`. The first builds will take a while. But as soon as you start the application the second time, the build runs faster

### Problems
#### Error running pod install -> CocoaPods requires your terminal to be using UTF-8 encoding
There might be the issue, that pod install is not working, because of UTF-8 encoding. If this is the case check your settings with ``locale`` in the terminal.
If necessary adapt it in the rc file (.zshrc or .bashrc )
```
export LANG=en_US.UTF-8
```
restart your terminal and try again flutter run

## Run Application via Run Configuration
Edit your Run Configuration, so that the Dart entrypoint is to
{PATH_TO_COUR_PROJECT}/lib/main.dart. 
Setup an Android Emulator in the Device Manager -> Create device -> choose a Phone -> choose an android version (tested with Pie)
To make the emulator a little bit faster, you can also choose under Emulate Performance -> Hardware
Now you can start the emulator with choosing the phone config you just made and the run config.

If you also want to run the ios version, you will need xcode and the Simulator installed. 
Start the Simulator. After that you can choose the phone in the dropdown plus the run config. click on run to start the application in the Simulator.

### Problems
#### Error running pod install -> CocoaPods requires your terminal to be using UTF-8 encoding
if you want to run flutter in ios via run configuration, there is a problem with cocoapods version higher 1.10.2.
First solution is, to simply run flutter via the terminal.
Second solution is to remove your current version of the cocoapods and rolling back to 1.10.2

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
