import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickedImage});

  final Function(File pickedImage) onPickedImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _submitImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);

    if(pickedImage==null) {
      return;
    }

    setState(() {
      _pickedImage = File(pickedImage.path);
    });

    widget.onPickedImage(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: _pickedImage == null ? null : FileImage(_pickedImage!),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: _submitImage,
          icon: Icon(
            Icons.image,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: Text(
            _pickedImage == null ? "Add Image" : "Edit Image",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
