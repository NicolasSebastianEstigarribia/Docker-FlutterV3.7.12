import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/views/login/login_page.dart';

void unsuccessfulLogin() {
  
  testWidgets('Login form should perform unsuccessful login', (WidgetTester tester) async {
    // Arrange
        await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: LoginPage())));

    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));
    final loginButton = find.byKey(const Key('login_button'));

    // Act
    await tester.enterText(emailField, 'dummy@example.com');
    await tester.enterText(passwordField, '1234');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Assert
    // Buscar el widget del AlertDialog
    final alertDialog = find.byType(AlertDialog);

    // Verificar si el AlertDialog está presente en la interfaz de usuario
    expect(alertDialog, findsOneWidget);

    // Buscar el widget de texto dentro del AlertDialog
    final errorText = find.descendant(
      of: alertDialog,
      matching: find.text('Error'),
    );

    // Verificar si el texto de error está presente dentro del AlertDialog
    expect(errorText, findsOneWidget);
  });

}