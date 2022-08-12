import 'dart:io';

import 'package:animax/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({
    Key? key,
    required this.size,
    this.defaultImage,
  }) : super(key: key);

  final double size;
  final ImageProvider? defaultImage;

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _image;

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery, maxWidth: 400);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(image.toString());
    return GestureDetector(
      onTap: pickImage,
      child: Avatar(
        size: widget.size,
        image: _image != null ? FileImage(_image!) : widget.defaultImage,
      ),
    );
  }
}
