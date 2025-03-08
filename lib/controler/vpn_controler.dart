import 'package:get/get.dart';
import 'package:vpn_basic_project/app-preference/app_preference.dart';
import 'package:vpn_basic_project/model/vpn_info.dart';

class VpnController extends GetxController{
  final Rx<VpnInfo> vpnInfo = AppPreference.vpnInfoObject.obs;

}