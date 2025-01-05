import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/repositories/preset_images_repository.dart';

final presetImagesRepositoryProvider = Provider<PresetImagesRepository>((ref) {
  return PresetImagesRepositoryImpl();
});

final presetRoomImagesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(presetImagesRepositoryProvider);
  return repository.getBackgroundImageUrls();
});

final santaAvatarsProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(presetImagesRepositoryProvider);
  return repository.getSantaAvatarUrls();
});
