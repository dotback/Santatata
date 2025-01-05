import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/providers/image_generation_flow_provider.dart';
import 'package:santa_video_generator/providers/image_upload_provider.dart';

class NextButton extends HookConsumerWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageUploadProvider);

    Future<void> onNextPressed() async {
      try {
        ref.read(imageUploadProvider.notifier).startUploading();

        // ここで必要な画像のアップロード処理を実行
        ref.read(videoGenerationStepProvider.notifier).state =
            VideoGenerationStep.imageGeneration;
      } catch (e) {
        ref
            .read(imageUploadProvider.notifier)
            .setError('画像のアップロードに失敗しました。時間をおいて再度お試しください。');
      } finally {
        ref.read(imageUploadProvider.notifier).finishUploading();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!state.hasRoomImage || !state.hasSantaAvatar)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              !state.hasRoomImage ? '部屋の画像を選択してください' : 'サンタクロースを選択してください',
              style: TextStyle(
                color: Colors.amber.shade700,
                fontSize: 12,
              ),
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              disabledBackgroundColor: Colors.grey.shade300,
            ),
            onPressed:
                !state.isValid || state.isUploading ? null : onNextPressed,
            child: state.isUploading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    '次へ進む',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
