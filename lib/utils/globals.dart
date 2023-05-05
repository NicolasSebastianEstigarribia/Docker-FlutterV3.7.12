import 'dart:convert';

import 'package:http/http.dart' as http;

const webScreenSize = 600;


Future<dynamic> fetchResponse(String url) async {
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final respuestaJSON = json.decode(response.body);
    return respuestaJSON;
  } else {
    throw Exception('Error al hacer la petición GET');
  }
}