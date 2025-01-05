import 'package:flutter_test/flutter_test.dart';
import 'package:santa_video_generator/repositories/preset_images_repository.dart';

void main() {
  group('PresetImagesRepository', () {
    late PresetImagesRepository repository;

    setUp(() {
      repository = PresetImagesRepositoryImpl();
    });

    test('開発環境でbackground画像のパスリストを取得できる', () async {
      final urls = await repository.getBackgroundImageUrls();
      expect(urls, isA<List<String>>());
      expect(urls.isNotEmpty, true);
      expect(
        urls.every(
            (url) => url.startsWith('assets/images/presets/backgrounds/')),
        true,
      );
    });

    test('開発環境でsantaアバター画像のパスリストを取得できる', () async {
      final urls = await repository.getSantaAvatarUrls();
      expect(urls, isA<List<String>>());
      expect(urls.isNotEmpty, true);
      expect(
        urls.every(
            (url) => url.startsWith('assets/images/presets/santa_avatars/')),
        true,
      );
    });
  });
}
