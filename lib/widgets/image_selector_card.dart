import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:santa_video_generator/models/upload_image.dart';

class ImageSelectorCard extends StatelessWidget {
  final String title;
  final String description;
  final UploadImage? selectedImage;
  final String? presetImageUrl;
  final Function(UploadImage) onImagePicked;
  final Function()? onRemove;
  final double height;
  final double? width;

  const ImageSelectorCard({
    super.key,
    required this.title,
    required this.description,
    this.selectedImage,
    this.presetImageUrl,
    required this.onImagePicked,
    this.onRemove,
    this.height = 200,
    this.width,
  });

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true, // bytes を取得するために必要
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        if (file.bytes != null) {
          onImagePicked(UploadImage(
            fileName: file.name,
            data: file.bytes!,
          ));
        }
      }
    } catch (e) {
      debugPrint('画像選択エラー: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _pickImage,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(16),
          child: selectedImage != null || presetImageUrl != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: selectedImage != null
                          ? Image.memory(
                              selectedImage!.data,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              presetImageUrl!,
                              fit: BoxFit.cover,
                            ),
                    ),
                    if (onRemove != null)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: onRemove,
                          color: Colors.white,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 48,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
