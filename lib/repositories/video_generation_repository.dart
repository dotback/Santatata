import 'dart:convert';
import 'dart:typed_data';
import 'package:santa_video_generator/core/config/env.dart';
import 'package:santa_video_generator/core/constants/api_constants.dart';
import 'package:santa_video_generator/core/constants/storage_urls.dart';
import 'package:santa_video_generator/models/video_generation_request.dart';
import 'package:santa_video_generator/models/video_generation_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class VideoGenerationRepository {
  Future<String> generateVideo({
    required Uint8List entranceImage,
    required Uint8List parentImage,
    required String customPrompt,
  });
}

class VideoGenerationRepositoryImpl implements VideoGenerationRepository {
  final Dio _dio;

  VideoGenerationRepositoryImpl(this._dio);

  @override
  Future<String> generateVideo({
    required Uint8List entranceImage,
    required Uint8List parentImage,
    required String customPrompt,
  }) async {
    if (!Env.isProduction) {
      debugPrint('開発環境: 動画生成APIをスキップ');
      debugPrint('カスタムプロンプト: $customPrompt');
      return StorageUrls.sampleVideoUrl;
    }

    final request = VideoGenerationRequest(
      entranceImage: base64Encode(entranceImage),
      parentImage: base64Encode(parentImage),
      customPrompt: customPrompt,
    );

    final response = await _dio.post(
      '${ApiConstants.baseUrl}/generate',
      data: request.toJson(),
    );

    final result = VideoGenerationResponse.fromJson(response.data);
    return result.videoUrl;
  }
}
