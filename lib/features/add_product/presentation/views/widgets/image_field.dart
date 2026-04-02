import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/helpers/is_arabic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageChanged});
  final ValueChanged<File?> onImageChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImage();
          } on Exception catch (e) {
            throw Exception('Error picking image: $e');
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFA),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE6E9E9), width: 1),
              ),
              child: imageFile != null
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(imageFile!, fit: BoxFit.cover),
                      ),
                    )
                  : const Icon(
                      Icons.image,
                      color: Color(0xFF949D9E),
                      size: 180,
                    ),
            ),
            Visibility(
              visible: imageFile != null,
              child: Positioned(
                top: 8,
                right: isArabic() ? null : 8,
                left: isArabic() ? 8 : null,
                child: GestureDetector(
                  onTap: () {
                    imageFile = null;
                    widget.onImageChanged(imageFile);
                    setState(() {});
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFA),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE6E9E9),
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.delete_forever_sharp,
                      color: Color(0xFF949D9E),
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      widget.onImageChanged(imageFile);
    }
  }
}
