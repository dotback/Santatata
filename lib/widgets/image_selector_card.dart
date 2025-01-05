import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
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
    final mediaInfo = await ImagePickerWeb.getImageInfo;
    if (mediaInfo != null && mediaInfo.data != null) {
      onImagePicked(UploadImage(
        fileName: mediaInfo.fileName ?? 'uploaded_image',
        data: mediaInfo.data!,
      ));
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
