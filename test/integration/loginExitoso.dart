import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/main.dart';


void loginExitoso() {

  testWidgets('Login form should perform an successful login',
      (WidgetTester tester) async {
    // Arrange
    await tester
        .pumpWidget(const MyApp());

    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));
    final loginButton = find.byKey(const Key('login_button'));

    // Act
    await tester.enterText(emailField, 'dummy@example.com');
    await tester.enterText(passwordField, '123');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Movies'), findsOneWidget);
    
  });

}
