import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_generation_state.freezed.dart';

@freezed
class VideoGenerationState with _$VideoGenerationState {
  const factory VideoGenerationState({
    @Default(null) Uint8List? entranceImage,
    @Default(null) Uint8List? parentImage,
    @Default('') String customPrompt,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default(null) String? generatedVideoUrl,
  }) = _VideoGenerationState;
}
