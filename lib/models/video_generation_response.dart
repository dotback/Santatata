import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_generation_response.freezed.dart';
part 'video_generation_response.g.dart';

@freezed
class VideoGenerationResponse with _$VideoGenerationResponse {
  const factory VideoGenerationResponse({
    required String videoUrl,
  }) = _VideoGenerationResponse;

  factory VideoGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationResponseFromJson(json);
}
