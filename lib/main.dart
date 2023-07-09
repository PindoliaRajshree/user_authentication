import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/firebase_options.dart';
import 'package:user_authentication/utils/localestring.dart';
import 'package:user_authentication/views/language_select_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UserAuthApp());
}

class UserAuthApp extends StatelessWidget {
  const UserAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en', 'US'),
      translations: LocaleString(),
      debugShowCheckedModeBanner: false,
      title: 'User Authentication',
      home: Language_Select_Page(),
    );
  }
}
