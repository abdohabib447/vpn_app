import 'package:flutter/material.dart';

class CustomConnectionWidget extends StatelessWidget {
  CustomConnectionWidget(
      {required this.function, required this.connectionStatus , required this.color});
  Function function;
  String connectionStatus;
  Color color;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent.withOpacity(0.1),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent.withOpacity(0.2),
            ),
            child: ElevatedButton(
              onPressed: () {
                function;
              },
              child: Icon(Icons.power_settings_new, size: 40),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(40),
                backgroundColor: Colors.redAccent,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(connectionStatus, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 20),
        Text("00 : 00 : 00", style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
