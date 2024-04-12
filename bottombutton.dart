import 'costant.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  Button({required this.bottomTitle, required this.onTap});

  final String bottomTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            bottomTitle,
            style: kCalculateTextStyle,
          ),
        ),
        height: kBottomHeightContainer,
        width: double.infinity,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
