import './appbar_icon.dart';

import 'package:flutter/material.dart';

import '../Constants.dart';

Widget customAppBar(double height, String title, Icon left, Icon right,
    Function onpressedLeft, Function onpressedRight) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height / 8 - 30),
    child: AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: appBarIcon(left, onpressedLeft, height),
      ),
      backgroundColor: ColorPalette.solidWhite,
      title: Text(
        title,
        style: Styles.blackText,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: appBarIcon(right, onpressedRight, height),
        )
      ],
    ),
  );
}
