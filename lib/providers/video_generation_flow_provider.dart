import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/core/constants/assets.dart';
import 'package:santa_video_generator/core/constants/storage_urls.dart';
import 'package:santa_video_generator/repositories/image_generation_repository.dart';
import 'package:santa_video_generator/states/video_generation_flow_state.dart';

final imageGenerationRepositoryProvider =
    Provider<ImageGenerationRepository>((ref) {
  return ImageGenerationRepositoryImpl();
});

final videoGenerationFlowProvider = StateNotifierProvider<
    VideoGenerationFlowNotifier, VideoGenerationFlowState>((ref) {
  return VideoGenerationFlowNotifier(
    imageGenerationRepository: ref.watch(imageGenerationRepositoryProvider),
  );
});

class VideoGenerationFlowNotifier
    extends StateNotifier<VideoGenerationFlowState> {
  final ImageGenerationRepository _imageGenerationRepository;

  VideoGenerationFlowNotifier({
    required ImageGenerationRepository imageGenerationRepository,
  })  : _imageGenerationRepository = imageGenerationRepository,
        super(const VideoGenerationFlowState());

  Future<void> startImageComposition() async {
    if (state.compositeImageUrl != null) return;

    state = state.copyWith(isCompositing: true);

    try {
      // 開発環境ではサンプル画像を表示
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(
        compositeImageUrl: Assets.compositedSantaImage[1],
      );
    } catch (e) {
      state = state.copyWith(error: '画像の合成に失敗しました');
    } finally {
      state = state.copyWith(isCompositing: false);
    }
  }

  Future<void> generateVideo(String prompt) async {
    state = state.copyWith(
      isGeneratingVideo: true,
      promptText: prompt,
    );

    try {
      // 開発環境ではサンプル動画を返す
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(
        generatedVideoUrl: StorageUrls.sampleVideoUrl,
      );
    } catch (e) {
      state = state.copyWith(error: '動画の生成に失敗しました');
    } finally {
      state = state.copyWith(isGeneratingVideo: false);
    }
  }
}
