import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

import '../model/vpn_info.dart';

class AppPreference {
  static late Box boxData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxData = await Hive.openBox('data');
  }

  /// save user data
  static void set isDarkMode(bool isDark) => boxData.put('isDark', isDark);
  static bool get isDarkMode => boxData.get('isDark') ?? false;

  /// save single selected vpn details
  static set vpnInfoObject(VpnInfo value) =>
      boxData.put("vpn", jsonEncode(value));
  static VpnInfo get vpnInfoObject => boxData.get("vpn" ?? "{}");

  /// save all vpn details
  static List<VpnInfo> get vpnList {
    List<VpnInfo> temp = [];
    final dataVpn = jsonDecode(boxData.get("vpn_list" ?? "[]"));
    for (var data in dataVpn) {
      temp.add(VpnInfo.fromJason(dataVpn));
    }
    return temp;
  }

  static set vpnList(List<VpnInfo> valueList) =>
      boxData.put("vpn_list", jsonEncode(valueList));
}
