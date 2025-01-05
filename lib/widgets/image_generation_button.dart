import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/pages/video_prompt_page.dart';
import 'package:santa_video_generator/providers/video_generation_flow_provider.dart';
import 'package:santa_video_generator/providers/image_upload_provider.dart';

class ImageGenerationButton extends HookConsumerWidget {
  const ImageGenerationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(imageUploadProvider);
    final flowState = ref.watch(videoGenerationFlowProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade400,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        onPressed: uploadState.isValid &&
                !flowState.isCompositing // isLoadingをisCompositingに修正
            ? () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const VideoPromptPage(),
                  ),
                )
            : null,
        child: flowState.isCompositing // isLoadingをisCompositingに修正
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                '画像を生成',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
