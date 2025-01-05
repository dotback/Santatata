import 'package:hooks_riverpod/hooks_riverpod.dart';

enum VideoGenerationStep {
  imageUpload, // 画像アップロード・選択
  imageGeneration, // 画像生成
  videoGeneration, // 動画生成
}

final videoGenerationStepProvider = StateProvider<VideoGenerationStep>((ref) {
  return VideoGenerationStep.imageUpload;
});
