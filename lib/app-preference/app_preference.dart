import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class AppPreference {
  static late Box boxData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxData = await Hive.openBox('data');
  }
  /// save user data
  static void set isDarkMode(bool isDark)=> boxData.put('isDark', isDark);
  static bool get isDarkMode=> boxData.get('isDark') ?? false;
}
