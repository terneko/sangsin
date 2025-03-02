import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(PhotoRepeatApp());
}

class PhotoRepeatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoRepeatScreen(),
    );
  }
}

class PhotoRepeatScreen extends StatefulWidget {
  @override
  _PhotoRepeatScreenState createState() => _PhotoRepeatScreenState();
}

class _PhotoRepeatScreenState extends State<PhotoRepeatScreen> {
  XFile? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> generatePhoto() async {
    if (selectedImage == null) return;

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final paint = Paint()..color = Colors.white;
    final double width = 1200; // 6 inches at 300 DPI
    final double height = 1800; // 4 inches at 300 DPI

    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);

    final img = File(selectedImage!.path);
    final data = await img.readAsBytes();
    final ui.Codec codec = await ui.instantiateImageCodec(data,
        targetWidth: 413, targetHeight: 496);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    // double y = height / 2;
    double offset = 20;
    double y = offset;
    for (int i = 0; i < 3; i++) {
      double x;
      for (int j = 0; j < 2; j++) {
        x = (j * (413 + offset)) + offset; // Define x based on column index
        canvas.drawImageRect(
          image,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          Rect.fromLTWH(x, y, 413, 496),
          Paint(),
        );
      }
      y += 496 + offset; // Adjust y for the next row
    }

    final ui.Image finalImage =
        await recorder.endRecording().toImage(width.toInt(), height.toInt());
    final ByteData? byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}\\output.png');
    await file.writeAsBytes(pngBytes);

    print('Image saved to ${file.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repeat Image Generator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: pickImage,
            child: Text('Select Image'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: generatePhoto,
            child: Text('Generate Photo'),
          ),
        ],
      ),
    );
  }
}
