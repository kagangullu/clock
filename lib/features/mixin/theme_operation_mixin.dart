import 'package:clock_app/features/view/theme/theme_view.dart';
import 'package:clock_app/product/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

mixin ThemeOperationMixin on State<ThemeView> {
  Future<String> loadImageList() async {
    return await rootBundle.loadString('assets/json/images.json');
  }

  Future<ImageModel> loadImageModel() async {
    String jsonString = await loadImageList();
    final jsonResponse = convert.jsonDecode(jsonString);
    return ImageModel.fromJson(jsonResponse);
  }
}
