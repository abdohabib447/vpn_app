import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app-preference/app_preference.dart';
import 'package:vpn_basic_project/model/vpn_configuration.dart';
import 'package:vpn_basic_project/model/vpn_info.dart';
import 'package:vpn_basic_project/vpn_engine/vpn_engine.dart';

class VpnController extends GetxController {
  final Rx<VpnInfo> vpnInfo = AppPreference.vpnInfoObject.obs;
  final vpnConnectionState = VpnEngine.vpnNotConnectedNow.obs;
  void connectionToVpnNow() async {
    if (vpnInfo.value.based64VpnConfigurationData.isEmpty) {
      Get.snackbar(
          "Country or location", "please select country or location please");
      return;
    }
    if (vpnConnectionState.value == VpnEngine.vpnNotConnectedNow) {
      final dataConfiguration =
          Base64Decoder().convert(vpnInfo.value.based64VpnConfigurationData);
      final configuration = Utf8Decoder().convert(dataConfiguration);
      final vpnConfiguration = VpnConfiguration(
        username: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryShortName,
        config: configuration,
      );
      await VpnEngine.startVpnNow(vpnConfiguration);
    }
  }

  Color get getRoundVpnButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnNotConnectedNow:
        return Colors.red;
      case VpnEngine.vpnConnectedNow:
        return Colors.green;
      default:
        return Colors.black12;
    }
  }

  String get getRoundVpnButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnNotConnectedNow:
        return "Let's Connect";
      case VpnEngine.vpnConnectedNow:
        return "Disconnect";
      default:
        return "Connection....";
    }
  }
}
