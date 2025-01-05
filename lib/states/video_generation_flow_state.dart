import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_generation_flow_state.freezed.dart';

@freezed
class VideoGenerationFlowState with _$VideoGenerationFlowState {
  const factory VideoGenerationFlowState({
    String? compositeImageUrl,
    String? generatedVideoUrl,
    String? promptText,
    @Default(false) bool isCompositing,
    @Default(false) bool isGeneratingVideo,
    String? error,
  }) = _VideoGenerationFlowState;
}
