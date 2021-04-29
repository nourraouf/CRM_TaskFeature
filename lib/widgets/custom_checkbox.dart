import 'package:crm_task_feature/Constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;

  CustomCheckbox({
    @required this.isChecked,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected
              ? ColorPalette.primaryColor
              : ColorPalette.inactiveColor,
          borderRadius: BorderRadius.circular(5.0),
          //  border: null
        ),
        width: 20,
        height: 20,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 11,
              )
            : null,
      ),
    );
  }
}
