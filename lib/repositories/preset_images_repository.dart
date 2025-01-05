import 'dart:typed_data';
import 'package:santa_video_generator/core/config/env.dart';

abstract class PresetImagesRepository {
  Future<List<String>> getBackgroundImageUrls();
  Future<List<String>> getSantaAvatarUrls();
  Future<Uint8List?> loadImage(String path);
}

class PresetImagesRepositoryImpl implements PresetImagesRepository {
  @override
  Future<List<String>> getBackgroundImageUrls() async {
    if (Env.isProduction) {
      // Cloud Storageからテキストファイルを取得してURLリストを返す
      throw UnimplementedError();
    } else {
      // assetsディレクトリから画像パスのリストを返す
      return [
        'assets/images/presets/backgrounds/background_image1.jpg',
        'assets/images/presets/backgrounds/background_image2.jpg',
      ];
    }
  }

  @override
  Future<List<String>> getSantaAvatarUrls() async {
    if (Env.isProduction) {
      throw UnimplementedError();
    } else {
      return [
        'assets/images/presets/santa_avatars/santa_image1.jpg',
        'assets/images/presets/santa_avatars/santa_image2.jpg',
      ];
    }
  }

  @override
  Future<Uint8List?> loadImage(String path) async {
    // 画像の読み込み処理
    throw UnimplementedError();
  }
}
