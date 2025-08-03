import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vpn_basic_project/model/vpn_configuration.dart';
import 'package:vpn_basic_project/model/vpn_status.dart';

class VpnEngine {
  static final String eventChannelVpnStage = "vpnStage";
  static final String eventChannelVpnStatus = "vpnStatus";
  static final String methodChannelVpnController = "vpnControl";

  /// vpn connection stage snapshot
  static Stream<String> snapshotVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  /// vpn connection status snapshot
  static Stream<String> snapshotVpnStatus() =>
      EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map((eventStatus) => VpnStatus.fromJson(jsonDecode(eventStatus)))
          .cast();

  /// start vpn
  static Future<void> startVpnNow(VpnConfiguration vpnConfiguration) async =>
      MethodChannel(methodChannelVpnController).invokeMethod("start", {
        "config": vpnConfiguration.config,
        "country": vpnConfiguration.countryName,
        "username": vpnConfiguration.username,
        "password": vpnConfiguration.password,
      });

  /// end vpn
  static Future<void> endVpn() async =>
      MethodChannel(methodChannelVpnController).invokeMethod("stop");

  /// kill vpn
  static Future<void> killSwitchOpenNow() =>
      MethodChannel(methodChannelVpnController).invokeMethod("kill_switch");

  /// refresh vpn
  static Future<void> refreshVpn() =>
      MethodChannel(methodChannelVpnController).invokeMethod("refresh");

  /// get vpn stage
  static Future<String?> getVpnStage() =>
      MethodChannel(methodChannelVpnController).invokeMethod("stage");

  /// check vpn connection
  static Future<bool> isConnection() =>
      getVpnStage().then((onValue) => onValue!.toLowerCase() == "connected");

  /// stage vpn connected
  static const String vpnConnectedNow = "connected";
  static const String vpnNotConnectedNow = "disconnected";
  static const String vpnWaitConnectedNow = "wait_connection";
  static const String vpnAuthNow = "authentication";
  static const String vpnReConnectedNow = "reconnected";
  static const String vpnNoConnectedNow = "no_connection";
  static const String vpnConnectionNow = "connection";
  static const String vpnPrepareNow = "prepare";
  static const String vpnDeniedNow = "denied";
}
