import 'package:flutter/material.dart';
import 'costant.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icon, this.label);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0,
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}