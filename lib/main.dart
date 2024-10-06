import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderncreditapp/domain/core/theme/theme_data.dart';
import 'package:moderncreditapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Credit Management App',
      debugShowCheckedModeBanner: false,
      // Apply themes
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.bottomNav,
      getPages: AppRoutes.pages,
    );
  }
}
