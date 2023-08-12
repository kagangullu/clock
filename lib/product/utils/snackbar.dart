import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

@immutable
class AppSnackBar {
  static SnackBar showSnackBar(ContentType contentType, String title,
      String message, BuildContext context) {
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        width: 800,
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ),
    );
    return snackBar;
  }
}
