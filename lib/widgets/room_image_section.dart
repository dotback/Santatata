import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/providers/image_upload_provider.dart';
import 'package:santa_video_generator/providers/preset_images_provider.dart';
import 'package:santa_video_generator/widgets/image_selector_card.dart';

class RoomImageSection extends HookConsumerWidget {
  const RoomImageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageUploadProvider);
    final presetImages = ref.watch(presetRoomImagesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '部屋の画像',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ImageSelectorCard(
          title: '部屋の画像をアップロード',
          description: '部屋の画像をアップロードするか、\n下のプリセットから選択してください',
          selectedImage: state.roomImage,
          presetImageUrl: state.selectedPresetRoomImageUrl,
          onImagePicked: (image) =>
              ref.read(imageUploadProvider.notifier).setRoomImage(image),
        ),
        const SizedBox(height: 16),
        presetImages.when(
          data: (urls) => _PresetRoomImages(urls: urls),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Text('プリセット画像の読み込みに失敗しました'),
        ),
      ],
    );
  }
}

class _PresetRoomImages extends HookConsumerWidget {
  final List<String> urls;

  const _PresetRoomImages({required this.urls});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final url = urls[index];
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: InkWell(
              onTap: () => ref
                  .read(imageUploadProvider.notifier)
                  .selectPresetRoomImage(url),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
