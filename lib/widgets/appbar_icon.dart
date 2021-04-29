import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

Widget appBarIcon(Icon icon, Function onButtonPressed, double height) {
  return FittedBox(
    child: Container(
      color: ColorPalette.backgroundColor,
      width: 45,
      height: 45,
      child: Center(
        child: IconButton(
          onPressed: onButtonPressed,
          icon: icon,
          iconSize: 19,
          color: ColorPalette.secondaryColor,
        ),
      ),
    ),
  );
}
