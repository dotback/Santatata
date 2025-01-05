import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoControlsBottom extends StatefulWidget {
  final VideoPlayerController controller;
  final String videoUrl;

  const VideoControlsBottom({
    super.key,
    required this.controller,
    required this.videoUrl,
  });

  @override
  State<VideoControlsBottom> createState() => _VideoControlsBottomState();
}

class _VideoControlsBottomState extends State<VideoControlsBottom> {
  double _volume = 0.0; // 初期値を0に設定

  @override
  void initState() {
    super.initState();
    _initVolume();
  }

  Future<void> _initVolume() async {
    await widget.controller.setVolume(_volume);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoProgressIndicator(
          widget.controller,
          allowScrubbing: true,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueListenableBuilder(
              valueListenable: widget.controller,
              builder: (context, VideoPlayerValue value, child) {
                return IconButton(
                  icon: Icon(
                    value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () {
                    if (value.isPlaying) {
                      widget.controller.pause();
                    } else {
                      widget.controller.play();
                    }
                  },
                );
              },
            ),
            // 音量コントロール
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    _volume == 0
                        ? Icons.volume_off
                        : _volume < 0.5
                            ? Icons.volume_down
                            : Icons.volume_up,
                  ),
                  onPressed: () {
                    setState(() {
                      _volume = _volume > 0 ? 0.0 : 1.0;
                      widget.controller.setVolume(_volume);
                    });
                  },
                ),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _volume,
                    onChanged: (value) {
                      setState(() {
                        _volume = value;
                        widget.controller.setVolume(_volume);
                      });
                    },
                  ),
                ),
              ],
            ),
            // ダウンロードボタン
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                final url = Uri.parse(widget.videoUrl);
                launchUrl(url);
              },
            ),
          ],
        ),
      ],
    );
  }
}
