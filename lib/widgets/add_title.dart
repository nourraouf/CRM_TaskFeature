import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

Widget addTitle(TextEditingController controller, double height, double width) {
  return Container(
    margin: EdgeInsets.fromLTRB(width * 0.034, 20, width * 0.034, 0),
    height: height * 0.11,
    width: width * 0.928,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), color: ColorPalette.solidWhite),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                const Text(
                  'Title',
                  style: Styles.greyText,
                ),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: height * 0.05,
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) return 'please enter a valid Description';
                return null;
              },
              cursorColor: ColorPalette.primaryColor,
              decoration: InputDecoration(),
            ),
          ),
        ],
      ),
    ),
  );
  //assigned;
}
