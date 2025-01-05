import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_controls_overlay.dart';
import 'video_controls_bottom.dart';

class VideoPlayerCard extends StatefulWidget {
  final String videoUrl;
  final String title;
  final bool autoPlay;
  final bool loop;

  const VideoPlayerCard({
    super.key,
    required this.videoUrl,
    required this.title,
    this.autoPlay = false,
    this.loop = false,
  });

  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late final Future<void> _initializeFuture;
  VideoPlayerController? _controller;
  bool _showControls = false;
  double _volume = 0;

  @override
  void initState() {
    super.initState();
    _initializeFuture = _setupController();
  }

  Future<void> _setupController() async {
    // 既存のコントローラーを破棄
    await _controller?.dispose();
    _controller = null;

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true,
      ),
    );

    controller.setVolume(_volume);
    controller.setLooping(widget.loop);
    await controller.initialize();

    if (!mounted) {
      return;
    }

    _controller = controller; // コントローラーを設定
    setState(() {}); // 状態を更新

    if (widget.autoPlay) {
      await controller.play(); // 自動再生
    }

    // controller.addListener(() {
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: _initializeFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final controller = _controller;
                if (controller == null) {
                  return const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child: Text('動画の読み込みに失敗しました'),
                    ),
                  );
                }

                return Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _showControls = true),
                      onExit: (_) => setState(() => _showControls = false),
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),
                          if (_showControls || !controller.value.isPlaying)
                            VideoControlsOverlay(
                              controller: controller,
                              onPlayPause: () async {
                                if (controller.value.isPlaying) {
                                  await controller.pause();
                                } else {
                                  await controller.play();
                                }
                                if (mounted) setState(() {});
                              },
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    VideoControlsBottom(
                      controller: controller,
                      videoUrl: widget.videoUrl,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
