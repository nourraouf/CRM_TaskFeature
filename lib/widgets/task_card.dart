import 'package:crm_task_feature/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @required
  final Color softBackground;
  @required
  final int numOfTasks;
  @required
  final String imagePath;
  @required
  final String taskCategory;
  TaskCard(
      {this.softBackground,
      this.numOfTasks,
      this.imagePath,
      this.taskCategory});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: ColorPalette.solidWhite,
      width: width * 0.34,
      height: height * 0.18,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, right: 5),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  size: height * 0.03,
                  color: ColorPalette.primaryColor,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              height: width * 0.15,
              width: width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: softBackground,
              ),
              child: Image.asset(
                imagePath,
                width: width * 0.07,
                height: height * 0.04,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            FittedBox(
              child: Text(
                numOfTasks.toString(),
                style: Styles.blackText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            FittedBox(
              child: Text(
                taskCategory,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: ColorPalette.secondaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
