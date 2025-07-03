# Background

A Flutter package to display images or videos as backgrounds.

## Features

A flexible Flutter widget to display a customizable background—image or video—behind any child widget.

- Image Background: Automatically displays an image when an image file path is provided.
- Video Background: Plays a muted, looping video when a video file path is detected.
- Child Overlay: Seamlessly overlays your child widget on top of the background.
- Smart Media Detection: Automatically identifies the background type based on the file path.
- Perfect for splash screens, login pages, or any UI that needs a rich, dynamic background.


<div style="display: flex; gap: 100px; align-items: flex-start;">
  <!-- Video background preview -->
  <img src="https://raw.githubusercontent.com/farhansadikgalib/background/main/screenshots/video.gif" height="300"/>

  <!-- Image background preview -->
  <img src="https://raw.githubusercontent.com/farhansadikgalib/background/main/screenshots/image.png" height="300"/>
</div>


<hr>

## Getting started

1. Add the latest version of package to your `pubspec.yaml` (and run `flutter pub get`):

```dart
dependencies:
background:^1.1.0
OR
```console
flutter pub add background
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:background/background.dart';
```

<hr>

## Example usage

### **Background Image**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Background(
        path: 'assets/png/image.png',
        child: Center(
          child: Text(
            'Hello, Farhan!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      )
  );
}
```
### **Background Video**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Background(
        path: 'assets/video/background.mp4',
        child: Center(
          child: Text(
            'Hello, Farhan!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      )
  );
}
```



## Supported File Types
| File Type | Supported    |
|-----------|--------------|
| Image     | PNG, JPG, JPEG, GIF, BMP, WEBP|
| Video     | MP4, MOV, AVI, MKV, WEBM|

