import 'package:flutter/material.dart';
import 'package:movie_admin/responsive/mobile_screen.dart';
import 'package:movie_admin/responsive/responsive_layout.dart';
import 'package:movie_admin/responsive/web_screen.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/view_models/my_home_page_model.dart';
import 'package:movie_admin/views/login_page.dart';

import 'package:provider/provider.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyViewModel()),
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Admin',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            if (authViewModel.isAuthenticated) {
              // usuario autenticado, muestra la pantalla principal
              return const ResponsiveLayout(
                mobileScreenLayout: MobileScreen(),
                webScreenLayout: WebScreen(),
              );
            } else {
              // usuario no autenticado, muestra la pantalla de login
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
