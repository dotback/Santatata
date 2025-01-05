import 'package:santa_video_generator/providers/video_generation_provider.dart';
import 'package:santa_video_generator/states/video_generation_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/core/config/env.dart';
import 'package:santa_video_generator/repositories/video_generation_repository.dart';
import 'package:santa_video_generator/repositories/mock_video_generation_repository.dart';

final videoGenerationRepositoryProvider = Provider<VideoGenerationRepository>(
  (ref) {
    if (Env.isProduction) {
      throw UnimplementedError('本番用リポジトリは未実装です');
    } else {
      return MockVideoGenerationRepository();
    }
  },
);

final videoGenerationProvider =
    StateNotifierProvider<VideoGenerationNotifier, VideoGenerationState>(
  (ref) => VideoGenerationNotifier(
    ref.watch(videoGenerationRepositoryProvider),
  ),
);
