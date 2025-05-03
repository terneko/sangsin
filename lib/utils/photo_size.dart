import 'package:flutter/material.dart';

class PhotoIdSize {
  static const Size oneInch = Size(295, 384);

  PhotoIdSize(double width, double height) : size = Size(width, height);

  @override
  String toString() => 'Width: ${size.width}, Height: ${size.height}';
}

void main() {
  PhotoIdSize photoSize = PhotoIdSize(295, 384); // Example size in pixels
  print(photoSize); // Output: Width: 295.0, Height: 384.0
}
