import 'package:santa_video_generator/core/constants/storage_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:santa_video_generator/repositories/video_generation_repository.dart';

class MockVideoGenerationRepository implements VideoGenerationRepository {
  @override
  Future<String> generateVideo({
    required Uint8List entranceImage,
    required Uint8List parentImage,
    required String customPrompt,
  }) async {
    // 開発用に処理を遅延させる
    await Future.delayed(const Duration(seconds: 2));

    debugPrint('Mock: 動画生成APIリクエスト');
    debugPrint('カスタムプロンプト: $customPrompt');

    return StorageUrls.sampleVideoUrl;
  }
}
