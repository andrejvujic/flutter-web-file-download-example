# flutter-web-file-download-example

This project is an example on how to download
files using Flutter Web. All the code is located in `lib/main.dart`.

## Dependenices
  The required packages are `http` and `universal_html`, as of April 9th, 2021 the latest versions are:
  ```
  http: ^0.13.1
  universal_html: ^2.0.8
  ```
  However you might have to upgrade depending on when you are using this. For latest version of `http` click <a href="https://pub.dev/packages/http/install">here</a> and for `universal_html` click <a href="https://pub.dev/packages/universal_html/install">here</a>.

  Note: `universal_html` is optional since you can use the builtin `dart:html` library, but you may get warnings because `dart:html` should be imported in web packages only.

## How to run?

To run this project first run `flutter pub get` to install all the dependenices.
Now you can run the project using `flutter run -d chrome`.

## About
Created with 💜 by Andrej Vujić 

## Contact
<a href="mailto:vujicandrej366@gmail.com">vujicandrej366@gmail.com</a>