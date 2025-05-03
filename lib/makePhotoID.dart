import 'dart:ffi';
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
  double? imageWidth;
  double? imageHeight;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final File imgFile = File(image.path);
      final Uint8List imgBytes = await imgFile.readAsBytes();

      ui.decodeImageFromList(imgBytes, (ui.Image img) {
        setState(() {
          selectedImage = image;
          imageWidth = img.width.toDouble();
          imageHeight = img.height.toDouble();
        });
        print("Image Width: $imageWidth, Height: $imageHeight");
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
        targetWidth: 354, targetHeight: 472);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    double offset = (width / 4) - 200;
    double y = offset;
    for (int i = 0; i < 3; i++) {
      double x;
      for (int j = 0; j < 2; j++) {
        // x = (j * (354 + offset)) + offset; // Define x based on column index
        x = (((width / 4) - 177) + (j * (width / 2)))
            .toInt()
            .toDouble(); // Define x based on column index
        canvas.drawImageRect(
          image,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          Rect.fromLTWH(x, y, 354, 472),
          Paint(),
        );
      }
      y += 472 + offset; // Adjust y for the next row
    }

    final ui.Image finalImage =
        await recorder.endRecording().toImage(width.toInt(), height.toInt());
    final ByteData? byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}\\output.png'); // Fixed path separator
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
          if (imageWidth != null && imageHeight != null)
            Text("Selected Image: ${imageWidth} × ${imageHeight} px"),
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
