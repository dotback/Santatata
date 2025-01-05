// lib/main.dart
import 'package:santa_video_generator/widgets/debug_banner.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/pages/video_generator_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIサンタがプレゼントを配る',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.red.shade400,
          secondary: Colors.grey.shade800,
        ),
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        fontFamily: 'Noto Sans JP', // フォントを指定
        useMaterial3: true,
      ),
      home: const DebugBanner(
        child: VideoGeneratorPage(),
      ),
    );
  }
}
