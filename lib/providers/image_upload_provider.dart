import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:santa_video_generator/models/upload_image.dart';
import 'package:santa_video_generator/states/image_upload_state.dart';

final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, ImageUploadState>((ref) {
  return ImageUploadNotifier();
});

class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  ImageUploadNotifier() : super(const ImageUploadState());

  void setRoomImage(UploadImage image) {
    if (image.data.lengthInBytes > 10 * 1024 * 1024) {
      // 10MB制限
      state = state.copyWith(
        errorMessage: '画像サイズは10MB以下にしてください',
      );
      return;
    }

    state = state.copyWith(
      roomImage: image,
      selectedPresetRoomImageUrl: null,
      errorMessage: null,
    );
  }

  void selectPresetRoomImage(String url) {
    state = state.copyWith(
      selectedPresetRoomImageUrl: url,
      roomImage: null,
      errorMessage: null,
    );
  }

  void setPersonImage(UploadImage image) {
    if (image.data.lengthInBytes > 10 * 1024 * 1024) {
      state = state.copyWith(
        errorMessage: '画像サイズは10MB以下にしてください',
      );
      return;
    }

    state = state.copyWith(
      personImage: image,
      errorMessage: null,
    );
  }

  void removePersonImage() {
    state = state.copyWith(
      personImage: null,
      errorMessage: null,
    );
  }

  void selectSantaAvatar(String url) {
    state = state.copyWith(
      selectedSantaAvatarUrl: url,
      errorMessage: null,
    );
  }

  void startUploading() {
    state = state.copyWith(isUploading: true);
  }

  void finishUploading() {
    state = state.copyWith(isUploading: false);
  }

  void setError(String message) {
    state = state.copyWith(
      errorMessage: message,
      isUploading: false,
    );
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
