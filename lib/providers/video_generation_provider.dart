// lib/features/video_generation/providers/video_generation_provider.dart
import 'dart:typed_data';

import 'package:santa_video_generator/core/constants/api_constants.dart';
import 'package:santa_video_generator/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/states/video_generation_state.dart';
import 'package:santa_video_generator/repositories/video_generation_repository.dart';

class VideoGenerationNotifier extends StateNotifier<VideoGenerationState> {
  final VideoGenerationRepository _repository;

  VideoGenerationNotifier(this._repository)
      : super(const VideoGenerationState());

  void setEntranceImage(Uint8List imageData) {
    state = state.copyWith(entranceImage: imageData);
  }

  void setParentImage(Uint8List imageData) {
    state = state.copyWith(parentImage: imageData);
  }

  void setCustomPrompt(String prompt) {
    state = state.copyWith(customPrompt: prompt);
  }

  Future<void> generateVideo() async {
    if (state.entranceImage == null || state.parentImage == null) {
      state = state.copyWith(
        errorMessage: '画像をアップロードしてください',
      );
      return;
    }

    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final fullPrompt = '''
${state.customPrompt}

${ApiConstants.defaultPrompt}
''';

      final videoUrl = await _repository.generateVideo(
        entranceImage: state.entranceImage!,
        parentImage: state.parentImage!,
        customPrompt: fullPrompt,
      );

      state = state.copyWith(
        generatedVideoUrl: videoUrl,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: '動画の生成に失敗しました',
        isLoading: false,
      );
    }
  }
}

final videoGenerationProvider =
    StateNotifierProvider<VideoGenerationNotifier, VideoGenerationState>(
  (ref) => VideoGenerationNotifier(
    ref.watch(videoGenerationRepositoryProvider),
  ),
);
