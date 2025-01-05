import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/pages/generated_video_page.dart';
import 'package:santa_video_generator/providers/video_generation_flow_provider.dart';

class VideoPromptPage extends HookConsumerWidget {
  const VideoPromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(videoGenerationFlowProvider);
    final promptController = useTextEditingController();
    // valueNotifierを使用してTextFieldの値の変更を監視
    final promptText = useState('');

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(videoGenerationFlowProvider.notifier).startImageComposition();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('動画生成'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 合成画像
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '合成された画像',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (state.isCompositing)
                          const Center(child: CircularProgressIndicator())
                        else if (state.compositeImageUrl != null)
                          Image.network(state.compositeImageUrl!)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (state.compositeImageUrl != null) ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'サンタクロースの動きを指定',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: promptController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: 'サンタクロースの動きを詳しく指定してください...',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => promptText.value =
                                value, // setStateの代わりにvalueNotifierを使用
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: state.compositeImageUrl != null &&
                            promptText.value.isNotEmpty &&
                            !state.isGeneratingVideo
                        ? () async {
                            // 遷移前にcontextを取得
                            final navigator = Navigator.of(context);

                            await ref
                                .read(videoGenerationFlowProvider.notifier)
                                .generateVideo(promptController.text);

                            if (!context.mounted) return;

                            await navigator.push(MaterialPageRoute(
                              builder: (context) => const GeneratedVideoPage(),
                            ));
                          }
                        : null,
                    child: state.isGeneratingVideo
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            '動画を生成',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
