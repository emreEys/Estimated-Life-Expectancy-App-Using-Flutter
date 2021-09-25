import 'package:estimated_life_expectancy/constants.dart';
import 'package:flutter/material.dart';

class IconCinsiyet extends StatelessWidget {
  final String gender;
  final IconData? icon;
  IconCinsiyet({this.gender = 'DEFAULT', this.icon = Icons.mood_bad});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(height: 10),
        Text(
          gender,
          style: kTextStyle,
        ),
      ],
    );
  }
}
