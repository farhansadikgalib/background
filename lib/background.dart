import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatefulWidget {
  final Widget child;
  final String path;

  const Background({super.key, required this.child, required this.path});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (_isVideo(widget.path)) {
      _videoController = VideoPlayerController.asset(widget.path!)
        ..setLooping(true)
        ..setVolume(0.0)
        ..initialize().then((_) {
          setState(() {});
          _videoController?.play();
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  bool _isImage(String? path) {
    final imageExtensions = ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'];
    return path != null &&
        imageExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  bool _isVideo(String? path) {
    final videoExtensions = ['.mp4', '.mov', '.avi', '.mkv', '.webm'];
    return path != null &&
        videoExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  @override
  Widget build(BuildContext context) {
    Widget background;

    if (_isImage(widget.path)) {
      background = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.path!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (_isVideo(widget.path) &&
        _videoController != null &&
        _videoController!.value.isInitialized) {
      background = VideoPlayer(_videoController!);
    } else {
      background = Container(color: Theme.of(context).colorScheme.surface);
    }

    return Stack(
      children: [
        Positioned.fill(child: background),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: widget.child,
              );
            },
          ),
        ),
      ],
    );
  }
}
