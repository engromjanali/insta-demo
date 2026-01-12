import 'package:flutter/painting.dart';

class ImagePayloadModel {
  final String? imagePath;
  final String? errorImage;
  final double? height, width, borderRadius;
  final BoxFit? fit;
  final bool? isCircular, isProfileImage;

  ImagePayloadModel({
    this.errorImage,
    this.fit,
    this.height,
    this.imagePath,
    this.isCircular,
    this.isProfileImage,
    this.width,
    this.borderRadius,
  });
}
