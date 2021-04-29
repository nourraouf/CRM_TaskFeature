import 'package:flutter/material.dart';

import '../Constants.dart';

class AddAtachments extends StatelessWidget {
  const AddAtachments({
    Key key,
    @required this.filename,
    @required this.load,
  }) : super(key: key);

  final String filename;
  final Function load;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: const Text("Attachments", style: Styles.greyText2),
          ),
          Container(
            height: height * 0.06,
            child: Row(
                //scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Icon(
                    Icons.attachment_rounded,
                    color: ColorPalette.secondaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: InkWell(
                      onTap: () async {
                        await load();
                      },
                      child: filename == null
                          ? FittedBox(
                              child: const Text(
                                "Upload your attachments",
                                style: Styles.greyText,
                              ),
                            )
                          : FittedBox(
                              child: Text(
                                filename,
                                style: Styles.greyText,
                              ),
                            ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
