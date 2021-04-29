import 'package:flutter/material.dart';

import '../Constants.dart';

class AddAssigned extends StatelessWidget {
  const AddAssigned({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.fromLTRB(width * 0.034, 10, width * 0.034, 5),
      height: height * 0.11,
      width: width * 0.928,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorPalette.solidWhite),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text("Assigned to", style: Styles.greyText),
            ),
            Container(
              width: width * 0.096,
              height: width * 0.096,
              child: Center(
                child: IconButton(
                  icon: Center(
                      child: const Icon(
                    Icons.add,
                    color: ColorPalette.secondaryColor,
                  )),
                  onPressed: () {},
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorPalette.solidWhite,
                border: Border.all(
                  color: Color(0xFFECECF2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
