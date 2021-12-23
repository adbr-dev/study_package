import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final _picker = ImagePicker();
                final image =
                    await _picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() {
                    _image = File(image.path);
                  });
                }
              },
              child: const Text('gallery 사진 가져오기'),
            ),
            ElevatedButton(
              onPressed: () async {
                final _picker = ImagePicker();
                final image =
                    await _picker.pickImage(source: ImageSource.camera);

                if (image != null) {
                  setState(() {
                    _image = File(image.path);
                  });
                }
              },
              child: const Text('camera 사진 촬영하기'),
            ),
            _image == null ? const Text('empty image') : Image.file(_image!),
          ],
        ),
      ),
    );
  }
}
