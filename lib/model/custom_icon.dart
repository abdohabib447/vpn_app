import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Function function;

  CustomIcon(
      {required this.icon,
      required this.label,
      required this.value,
      required this.color,
      required this.function
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: IconButton(onPressed: (){function;}, icon: Icon(icon, color: color)),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
