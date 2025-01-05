import 'dart:typed_data';
import 'package:santa_video_generator/core/config/env.dart';

abstract class ImageGenerationRepository {
  Future<String> generateImage({
    required String roomImageUrl,
    required Uint8List? uploadedRoomImage,
    required String santaImageUrl,
    required String prompt,
  });
}

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  @override
  Future<String> generateImage({
    required String roomImageUrl,
    required Uint8List? uploadedRoomImage,
    required String santaImageUrl,
    required String prompt,
  }) async {
    if (Env.isProduction) {
      throw UnimplementedError('本番環境用の実装が必要です');
    }

    // 開発環境では事前に用意した合成画像を返す
    await Future.delayed(const Duration(seconds: 2)); // ローディング表示確認用
    return 'assets/images/generated/sample_composition.png';
  }
}
