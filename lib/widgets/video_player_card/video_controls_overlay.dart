import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onPlayPause;

  const VideoControlsOverlay({
    super.key,
    required this.controller,
    required this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black26,
        child: Center(
          child: IconButton(
            iconSize: 64,
            icon: Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: onPlayPause,
          ),
        ),
      ),
    );
  }
}
