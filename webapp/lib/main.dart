import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'provider/theme.dart';
import 'routes/routes.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD9LDmp4HJKkTF3ZXye_g46h9VbeowwDQA",
          authDomain: "clickers-c221f.firebaseapp.com",
          projectId: "clickers-c221f",
          storageBucket: "clickers-c221f.appspot.com",
          messagingSenderId: "180721429002",
          appId: "1:180721429002:web:a5939483bed94ac5be4df3",
          measurementId: "G-KPGCKGKQ3R"));

  configureApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return ThemeProvider(
          initTheme: ref.watch(themeProvider).isDarkMode
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
          child: MaterialApp(
            title: "Agnel Selvan",
            debugShowCheckedModeBanner: false,
            themeMode: ref.watch(themeProvider).themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            initialRoute: Routes.initial,
            onGenerateRoute: RouterGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
