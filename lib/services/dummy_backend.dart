import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> loginRequest(String username, String password) {
  // Comprueba si el usuario y la contraseña son válidos
  if (username == 'dummy@example.com' && password == '123') {
    // Respuesta JSON exitosa
    final jsonResponse = {
      'sts': 1,
      'msg': 'Valid credentials',
      'token': 'ABC123',
    };

    return Future.delayed(const Duration(seconds: 2), () {
      return http.Response(json.encode(jsonResponse), 200);
    });
  } else {
    // Respuesta JSON de error
    final errorResponse = {
      'sts': 0,
      'msg': 'Invalid credentials',
    };

    return Future.delayed(const Duration(seconds: 2), () {
      return http.Response(json.encode(errorResponse), 200);
    });
  }
}

bool validApiResponse(BuildContext context, dynamic json) {
  if (json['sts'] == 0) {
    alert(context, 'Error', json['msg']);
    return false;
  } else {
    return true;
  }
}

Future<void> alert(BuildContext context, String title, String content) {
  return Future.delayed(
    Duration.zero,
    () => showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ),
  );
}
