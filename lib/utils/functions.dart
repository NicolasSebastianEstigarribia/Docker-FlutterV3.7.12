
import 'package:flutter/material.dart';

String getApiKey() {
  return "14fd113c";
}

List<String> separateWords(String str) {
  return str.split(",").map((palabra) => palabra.trim()).toList();
}

List<Text> textString(List<String> string) {
  return string.map((palabra) {
    return Text(palabra);
  }).toList();
}
