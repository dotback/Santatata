import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/providers/video_generation_flow_provider.dart';
import 'package:santa_video_generator/widgets/video_player_card/video_player_card.dart';

class GeneratedVideoPage extends HookConsumerWidget {
  const GeneratedVideoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoUrl = ref.watch(
      videoGenerationFlowProvider.select((s) => s.generatedVideoUrl),
    );
    final volume = useState(0.0); // 音量の初期値を0に設定

    return Scaffold(
      appBar: AppBar(
        title: const Text('生成された動画'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                if (videoUrl != null) ...[
                  VideoPlayerCard(
                    videoUrl: videoUrl,
                    title: '生成された動画',
                    autoPlay: true,
                  ),
                  const SizedBox(height: 16),
                  // 音量コントロール
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            volume.value == 0
                                ? Icons.volume_off
                                : volume.value < 0.5
                                    ? Icons.volume_down
                                    : Icons.volume_up,
                          ),
                          Expanded(
                            child: Slider(
                              value: volume.value,
                              onChanged: (value) {
                                volume.value = value;
                              },
                            ),
                          ),
                          Text('${(volume.value * 100).toInt()}%'),
                        ],
                      ),
                    ),
                  ),
                ] else
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
