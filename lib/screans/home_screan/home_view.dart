import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vpn_basic_project/app-preference/app_preference.dart';

class HomeView extends StatelessWidget {
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
      body: Text('data'),
      bottomNavigationBar:
         handleBottumNavigationBar(context),
    );
  }

  handleBottumNavigationBar(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(6),
        height: high* 0.1,
        color: Colors.red,
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
    );
  }
}
// BottomNavigationBar(backgroundColor: Colors.red, items: [
// BottomNavigationBarItem(
// label: ' ',
// icon: IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.flag_circle_outlined,
// color: Colors.white,
// ))),
// BottomNavigationBarItem(
// label: ' ',
// icon: TextButton(
// onPressed: () {},
// child: Text(
// 'select country/location',
// style: TextStyle(color: Colors.white),
// ))),
// BottomNavigationBarItem(
// label: ' ',
// icon: CircleAvatar(
// backgroundColor: Colors.white,
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.keyboard_arrow_right_outlined))))
// ]),