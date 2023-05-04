import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const Text('notifications'),
  const Text('notifications'),
  const Text('notifications'),
  const Text('notifications'),
    const Text('notifications'),
];



Future<dynamic> fetchResponse(String url) async {
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final respuestaJSON = json.decode(response.body);
    return respuestaJSON;
  } else {
    throw Exception('Error al hacer la petición GET');
  }
}
