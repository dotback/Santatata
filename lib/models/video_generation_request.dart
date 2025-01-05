import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_generation_request.freezed.dart';
part 'video_generation_request.g.dart';

@freezed
class VideoGenerationRequest with _$VideoGenerationRequest {
  const factory VideoGenerationRequest({
    required String entranceImage, // base64エンコードされた画像
    required String parentImage, // base64エンコードされた画像
    required String customPrompt,
  }) = _VideoGenerationRequest;

  factory VideoGenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationRequestFromJson(json);
}
