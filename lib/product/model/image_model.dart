import 'package:flutter/material.dart';

@immutable
class ImageModel {
  final List<String> images;

  ImageModel({required this.images});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(images: List<String>.from(json['images']));
  }
}
