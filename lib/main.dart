import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app-preference/app_preference.dart';
import 'package:vpn_basic_project/screans/home_screan/home_view.dart';
import 'package:vpn_basic_project/theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: AppPreference.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.route: (context) => HomeView(),
      },
      initialRoute: HomeView.route,
    );
  }
}
