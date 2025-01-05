import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santa_video_generator/models/upload_image.dart';

part 'image_upload_state.freezed.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const ImageUploadState._(); // フリーズドクラスで拡張メソッドを使用するために必要

  const factory ImageUploadState({
    UploadImage? roomImage,
    String? selectedPresetRoomImageUrl,
    UploadImage? personImage,
    String? selectedSantaAvatarUrl,
    @Default(false) bool isUploading,
    String? errorMessage,
  }) = _ImageUploadState;

  bool get hasRoomImage =>
      roomImage != null || selectedPresetRoomImageUrl != null;
  bool get hasSantaAvatar => selectedSantaAvatarUrl != null;
  bool get isValid => hasRoomImage && hasSantaAvatar;
}

extension ImageUploadStateX on ImageUploadState {
  bool get hasRoomImage =>
      roomImage != null || selectedPresetRoomImageUrl != null;
  bool get hasSantaAvatar => selectedSantaAvatarUrl != null;
  bool get isValid => hasRoomImage && hasSantaAvatar;
}
