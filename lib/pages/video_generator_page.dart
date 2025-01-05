import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/core/constants/storage_urls.dart';
import 'package:santa_video_generator/widgets/room_image_section.dart';
import 'package:santa_video_generator/widgets/santa_avatar_section.dart';
import 'package:santa_video_generator/widgets/image_generation_button.dart';
import 'package:santa_video_generator/widgets/video_player_card/video_player_card.dart';

class VideoGeneratorPage extends HookConsumerWidget {
  const VideoGeneratorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIサンタ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'サンタクロースを選んで部屋に配置しよう！',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 768) {
                      return const _MobileLayout();
                    }
                    return const _DesktopLayout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 左カラムの内容
        Column(
          children: [
            _ImageSelectionSection(),
            SizedBox(height: 32),
            Divider(height: 1),
            SizedBox(height: 32),
            _SantaSelectionSection(),
            SizedBox(height: 32),
            ImageGenerationButton(),
          ],
        ),
        SizedBox(height: 24),
        // 右カラムの内容
        VideoPlayerCard(
          videoUrl: StorageUrls.sampleVideoUrl,
          title: 'サンプル動画',
          autoPlay: true,
          loop: true,
        ),
      ],
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左カラム
        Expanded(
          flex: 3,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ImageSelectionSection(),
                  SizedBox(height: 32),
                  Divider(height: 1),
                  SizedBox(height: 32),
                  _SantaSelectionSection(),
                  SizedBox(height: 32),
                  ImageGenerationButton(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 24),
        // 右カラム
        Expanded(
          flex: 2,
          child: VideoPlayerCard(
            videoUrl: StorageUrls.sampleVideoUrl,
            title: 'サンプル動画',
            autoPlay: true,
            loop: true,
          ),
        ),
      ],
    );
  }
}

class _ImageSelectionSection extends StatelessWidget {
  const _ImageSelectionSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   '部屋の画像',
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(height: 16),
        RoomImageSection(),
      ],
    );
  }
}

class _SantaSelectionSection extends StatelessWidget {
  const _SantaSelectionSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'サンタクロースの選択',
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // SizedBox(height: 16),
        SantaAvatarSection(),
      ],
    );
  }
}
