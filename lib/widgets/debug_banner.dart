import 'package:flutter/material.dart';
import 'package:santa_video_generator/core/config/env.dart';

class DebugBanner extends StatelessWidget {
  final Widget child;

  const DebugBanner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (Env.isProduction) return child;

    return Banner(
      message: 'DEV',
      location: BannerLocation.topEnd,
      // より控えめな色に変更
      color: Colors.grey.shade200,
      textStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      child: child,
    );
  }
}
