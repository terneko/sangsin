import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sangsin/utils/app_styles.dart';
import 'dart:io';

import '../sizeSelector.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Allow only image selection
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      appBar: AppBar(
        title:
            const Text('Personal Photo', style: TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 400,
                            height: 500,
                            color: AppTheme.grey,
                            child: _selectedImage != null
                                ? Center(
                                    child: Image.file(_selectedImage!),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconData(0xeb93,
                                            fontFamily: 'MaterialIcons'),
                                        color: Colors.white,
                                        size: 55,
                                      ),
                                      TextButton(
                                        onPressed: _pickImage,
                                        child: const Text(
                                          "Add Photo",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(Icons.add_a_photo,
                                  color: Colors.white, size: 30),
                              onPressed: _pickImage,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SelectionTable()), // Table takes remaining space
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
