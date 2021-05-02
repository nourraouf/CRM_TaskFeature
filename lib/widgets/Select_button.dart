import 'package:flutter/material.dart';

import '../Constants.dart';

class SelectButton extends StatelessWidget {
  const SelectButton(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.text,
      @required this.icon,
      @required this.onButtonPressed})
      : super(key: key);

  final double width;
  final double height;
  final String text;
  final Icon icon;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.044,
      child: ElevatedButton.icon(
          label: Text(
            text,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff252631),
            ),
          ),
          icon: icon,
          style: ElevatedButton.styleFrom(
              primary: ColorPalette.solidWhite,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              side: BorderSide(color: Color(0xffECECF2), width: 1)),
          onPressed: () {
            onButtonPressed(context);
          }),
    );
  }
}
