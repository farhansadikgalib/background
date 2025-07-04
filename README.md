
---

# 🖼️ Background


A **Flutter package** to beautifully display **images or videos** as dynamic backgrounds for your screens. Perfect for splash screens, login UIs, onboarding flows, and more!

[![GitHub stars](https://img.shields.io/github/stars/farhansadikgalib/background?style=social)](https://github.com/farhansadikgalib/background)
![GitHub last commit](https://img.shields.io/github/last-commit/farhansadikgalib/background)
![Pub Version](https://img.shields.io/pub/v/background)
![License](https://img.shields.io/github/license/farhansadikgalib/background)
[![Website](https://img.shields.io/badge/%20Website-farhansadikgalib.com-blue?logo=google-chrome&logoColor=white&style=flat)](https://farhansadikgalib.com/)

---

## ✨ Features

-  **Image Background** – Displays a static image when a supported image file is passed
-  **Video Background** – Loops and plays a muted video in the background automatically
-  **Overlay Support** – Seamlessly renders your widgets on top of the background
-  **Auto File Type Detection** – Automatically detects whether the background file is an image or a video
-  **Smooth & Clean UI** – Delivers professional UI experiences out of the box

---

## 🎬 Demo

<table>
  <tr>
    <th>🎥 Video Background</th>
    <th>🖼️ Image Background</th>
  </tr>
  <tr>
    <td>
      <img src="https://raw.githubusercontent.com/farhansadikgalib/background/main/screenshots/video.gif" width="150" height="300"/>
    </td>
    <td>
      <img src="https://raw.githubusercontent.com/farhansadikgalib/background/main/screenshots/image.png" width="150" height="300"/>
    </td>
  </tr>
</table>

---

## 🚀 Getting Started

### 1. Install the package

Add to your `pubspec.yaml`:

```yaml
dependencies:
  background: <latest version>
```

Or use the command line:

```bash
flutter pub add background
```

### 2. Import it

```dart
import 'package:background/background.dart';
```

---

## 💡 Usage Examples

### 🖼️ Image Background

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Background(
      path: 'assets/png/image.png', // Your image asset path
      child: Center(
        child: Text(
          'Hello, Farhan!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    ),
  );
}
```

### 🎥 Video Background

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Background(
      path: 'assets/video/video.mp4', // Your video asset path
      child: Center(
        child: Text(
          'Hello, Farhan!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    ),
  );
}
```

---

## 📁 Supported File Types

| Type  | Extensions                                       |
| ----- | ------------------------------------------------ |
| Image | `.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.webp` |
| Video | `.mp4`, `.mov`, `.avi`, `.mkv`, `.webm`          |

---

## 🛠️ Tips

* Make sure your video files are muted or use a player that supports muted autoplay.
* For mobile platforms, add video assets correctly in your `pubspec.yaml` under the `assets:` section.

---

## 🤝 Contributing

Pull requests and stars are welcome!
If you find a bug or have a feature request, feel free to [open an issue](https://github.com/farhansadikgalib/background/issues).

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/farhansadikgalib/background/blob/main/LICENSE) file for details.

---

**Made with ❤️ by [Farhan Sadik Galib](https://github.com/farhansadikgalib)**

---
