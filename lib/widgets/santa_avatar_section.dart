import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/providers/image_upload_provider.dart';
import 'package:santa_video_generator/providers/preset_images_provider.dart';

class SantaAvatarSection extends HookConsumerWidget {
  const SantaAvatarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(imageUploadProvider);
    final santaAvatars = ref.watch(santaAvatarsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'サンタクロースの選択',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        santaAvatars.when(
          data: (urls) => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: urls.length,
            itemBuilder: (context, index) {
              final url = urls[index];
              final isSelected = state.selectedSantaAvatarUrl == url;

              return InkWell(
                onTap: () => ref
                    .read(imageUploadProvider.notifier)
                    .selectSantaAvatar(url),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Text('サンタの画像の読み込みに失敗しました'),
        ),
      ],
    );
  }
}
