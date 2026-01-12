import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void callBackFunction(Function callback) {
  // Ensure WidgetsBinding is initialized
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

void printer(dynamic value) {
  if (kDebugMode) {
    print("📌 $value 📌");
  }
}

void errorPrint(dynamic value) {
  printer("🐞 $value 🐛");
}

void infoPrint(dynamic value) {
  printer("📌 $value 📌");
}
