import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// A widget that displays a background which can be either an image or a video.
/// The background is determined based on the file extension of the provided path.
/// It also overlays a child widget on top of the background.
///
/// The `Background` widget supports the following file types:
/// - Images: `.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.webp`
/// - Videos: `.mp4`, `.mov`, `.avi`, `.mkv`, `.webm`
class Background extends StatefulWidget {
  /// The child widget to overlay on top of the background.
  final Widget child;

  /// The file path of the background asset (image or video).
  final String path;

  /// Creates a `Background` widget.
  const Background({super.key, required this.child, required this.path});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  /// Controller for managing video playback.
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller if the provided path is a video.
    if (_isVideo(widget.path)) {
      _videoController = VideoPlayerController.asset(widget.path)
        ..setLooping(true) // Loop the video playback.
        ..setVolume(0.0) // Mute the video.
        ..initialize().then((_) {
          setState(() {}); // Update the UI after initialization.
          _videoController?.play(); // Start video playback.
        });
    }
  }

  @override
  void dispose() {
    // Dispose of the video controller to free resources.
    _videoController?.dispose();
    super.dispose();
  }

  /// Checks if the provided path corresponds to an image file.
  ///
  /// Supported image extensions:
  /// `.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.webp`
  bool _isImage(String? path) {
    final imageExtensions = ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'];
    return path != null &&
        imageExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  /// Checks if the provided path corresponds to a video file.
  ///
  /// Supported video extensions:
  /// `.mp4`, `.mov`, `.avi`, `.mkv`, `.webm`
  bool _isVideo(String? path) {
    final videoExtensions = ['.mp4', '.mov', '.avi', '.mkv', '.webm'];
    return path != null &&
        videoExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  @override
  Widget build(BuildContext context) {
    Widget background;

    // Determine the background widget based on the file type.
    if (_isImage(widget.path)) {
      background = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.path), // Load the image asset.
            fit: BoxFit.cover, // Cover the entire container.
          ),
        ),
      );
    } else if (_isVideo(widget.path) &&
        _videoController != null &&
        _videoController!.value.isInitialized) {
      background = VideoPlayer(_videoController!); // Display the video.
    } else {
      background = Container(
          color: Theme.of(context).colorScheme.surface); // Fallback background.
    }

    // Overlay the child widget on top of the background.
    return Stack(
      children: [
        Positioned.fill(
            child: background), // Fill the entire area with the background.
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth, // Match the width of the parent.
                height:
                    constraints.maxHeight, // Match the height of the parent.
                child: widget.child, // Display the child widget.
              );
            },
          ),
        ),
      ],
    );
  }
}
