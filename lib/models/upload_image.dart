import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image.freezed.dart';

@freezed
class UploadImage with _$UploadImage {
  const factory UploadImage({
    required String fileName,
    required Uint8List data,
  }) = _UploadImage;
}
