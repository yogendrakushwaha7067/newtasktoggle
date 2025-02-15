import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void showCustomSnackbar(String title, String message, bool isSuccess) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    colorText: Colors.white,
    icon: Icon(
      isSuccess ? Icons.check_circle : Icons.error,
      color: Colors.white,
    ),
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(15),
    borderRadius: 10,
    snackStyle: SnackStyle.FLOATING,
  );
}
