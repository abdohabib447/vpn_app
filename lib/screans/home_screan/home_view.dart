import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app-preference/app_preference.dart';
import 'package:vpn_basic_project/controler/vpn_controler.dart';
import 'package:vpn_basic_project/model/custom_connection_widget.dart';
import 'package:vpn_basic_project/model/custom_icon.dart';

class HomeView extends StatelessWidget {
  final homeController = Get.put(VpnController());
  static const String route = 'home';
  late var high;
  late var width;
  @override
  Widget build(BuildContext context) {
    high = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Free VPN'),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(
                  AppPreference.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                );
                AppPreference.isDarkMode = !AppPreference.isDarkMode;
              },
              icon: Icon(Icons.brightness_2))
        ],
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.perm_device_info)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIcon(
                  icon: Icons.location_on,
                  label: "Location",
                  value: "FREE",
                  color: Colors.redAccent,
                  function: () {}),
              CustomIcon(
                  icon: Icons.network_check,
                  label: "PING",
                  value: "60 ms",
                  color: Colors.grey,
                  function: () {}),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CustomConnectionWidget(
            function: () {},
            connectionStatus: homeController.getRoundVpnButtonText,
            color: homeController.getRoundVpnButtonColor,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIcon(
                icon: Icons.arrow_downward,
                label: "DOWNLOAD",
                value: "0 kbps",
                color: Colors.green,
                function: () {},
              ),
              CustomIcon(
                icon: Icons.arrow_upward,
                label: "UPLOAD",
                value: "0 kbps",
                color: Colors.purple,
                function: () {},
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: handleBottunNavigationBar(context),
    );
  }

  handleBottunNavigationBar(BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(6),
            height: high * 0.1,
            color: Colors.redAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.flag_circle_outlined,
                    //color: Colors.white,
                  ),
                ),
                Text(
                  'select country/location',
                  style: TextStyle(color: Colors.white),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.keyboard_arrow_right_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

