import 'package:crm_task_feature/screens/add_new_task.dart';
import 'package:crm_task_feature/screens/done_tasks.dart';
import 'package:crm_task_feature/screens/not_implemented.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class ExtractedNavigationBar extends StatefulWidget {
  const ExtractedNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _ExtractedNavigationBarState createState() => _ExtractedNavigationBarState();
}

class _ExtractedNavigationBarState extends State<ExtractedNavigationBar> {
  final List<Widget> _pages = [
    NotImplemented(),
    AllTasks(),
    AddTask(),
    NotImplemented(),
    NotImplemented(),
    NotImplemented(),
  ];
  int _currentIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // onTap: ,
      currentIndex: _currentIndex,
      elevation: 4,
      backgroundColor: ColorPalette.solidWhite,
      selectedItemColor: ColorPalette.primaryColor,
      unselectedItemColor: ColorPalette.secondaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_size_select_actual_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_today_sharp,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu_rounded,
          ),
          label: '',
        ),
      ],
    );
  }
}
