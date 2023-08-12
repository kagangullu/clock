import 'package:flutter/material.dart';

@immutable
class Sound {
  final String name;
  final String path;
  final String imagePath;

  Sound(this.imagePath, {required this.name, required this.path});
}
