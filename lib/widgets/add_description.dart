import 'package:flutter/material.dart';

import '../Constants.dart';

class AddDescription extends StatelessWidget {
  // final Key formKey;
  final TextEditingController discontroller;

  const AddDescription({Key key, @required this.discontroller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: height * 0.008, top: height * 0.008),
      margin: EdgeInsets.fromLTRB(width * 0.034, 0, width * 0.034, 5),
      height: height * 0.15,
      width: width * 0.928,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorPalette.solidWhite),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //    width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Row(
                //  scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const Text(
                    'Description',
                    style: Styles.greyText,
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: const Text(
                  'Start typing...',
                  style: Styles.greyText,
                ),
              ),
            ),
            Container(
              height: height * 0.05,
              child: TextFormField(
                controller: discontroller,
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
  }
}
