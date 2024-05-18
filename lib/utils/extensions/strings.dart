import 'dart:io';

import 'package:flutter/material.dart';

extension ExtString on String? {
  String formatWithSpaces() {
    String valueString = toString();
    if (valueString.length <= 3) {
      return valueString;
    }
    String formattedValue = '';
    int remainder = valueString.length % 3;
    formattedValue += valueString.substring(0, remainder);
    for (int i = remainder; i < valueString.length; i += 3) {
      if (formattedValue.isNotEmpty) {
        formattedValue += ' ';
      }
      formattedValue += valueString.substring(i, i + 3);
    }
    return formattedValue;
  }
}
