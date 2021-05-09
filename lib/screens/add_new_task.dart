import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/models/task.dart';
import 'package:crm_task_feature/providers.dart/tasks.dart';
import 'package:crm_task_feature/widgets/Navigation_bar.dart';
import 'package:crm_task_feature/widgets/Select_button.dart';
import 'package:crm_task_feature/widgets/add_attachments.dart';
import 'package:crm_task_feature/widgets/add_description.dart';
import 'package:crm_task_feature/widgets/add_title.dart';
import 'package:crm_task_feature/widgets/custom_appbar.dart';
import 'package:crm_task_feature/widgets/success_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  static const routeName = '/add task';
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String dropdownValue = 'Ahmed';
  DateTime _selectedDate = null;
  String taskTitle;
  String taskDescription;
  String taskDate;

  final _addFormKey = GlobalKey<FormState>();
  final f = new DateFormat('dd MMM yyyy');
  PlatformFile _attachments = null;
  final _description = TextEditingController();
  final _taskTitle = TextEditingController();
  String _filename = null;
  bool _submit(BuildContext context) {
    if (_addFormKey.currentState.validate()) {
      _addFormKey.currentState.save();
      Provider.of<Tasks>(context, listen: false).addTask(Task(
          assignedTo: dropdownValue,
          description: _description.text,
          endDate: _selectedDate,
          startDate: DateTime.now(),
          tag: ''));
      setState(() {
        _attachments = null;
        taskDate =
            _selectedDate == null ? DateTime.now() : f.format(_selectedDate);
        taskDescription = _description.text;
        taskTitle = _taskTitle.text;
        _selectedDate = null;
      });

      _description.clear();
      _taskTitle.clear();

      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _loadFile() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        _attachments = file;
        setState(() {
          _filename = file.name;
        });
      } else {
        // User canceled the picker
      }
    }

    void showAlertDialog(BuildContext context, String text, int status) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    if (status == 1) {
                      Navigator.of(context).pushReplacementNamed('/');
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('ok'))
            ],
            content: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
              ),
              child: status == 1
                  ? SuccessDialog(
                      taskTitle: taskDescription,
                      description: taskDescription,
                      assignedTo: dropdownValue,
                      filename: _filename,
                      taskDate: taskDate,
                    )
                  : Text("Please enter a valid data"),
            ),
          );
        },
      );
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2022));
      if (picked != null && picked != _selectedDate)
        setState(() {
          _selectedDate = picked;
          print(_selectedDate.toIso8601String());
        });
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: customAppBar(
        height,
        "Add New Task",
        Icon(Icons.keyboard_arrow_left),
        Icon(Icons.more_vert),
        () {
          Navigator.pushNamed(context, '/');
        },
        () {},
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            //title
            addTitle(_taskTitle, height, width),
            //assigned

            Container(
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
                      width: width * 0.3,
                      height: width * 0.096,
                      child: Center(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.add),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Ahmed', 'Menna', 'Mariem']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
            ),

            //due to
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.fromLTRB(width * 0.034, 0, width * 0.034, 5),
              height: height * 0.11,
              width: width * 0.928,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorPalette.solidWhite),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text("Due to", style: Styles.greyText),
                    ),
                    Container(
                      height: height * 0.06,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SelectButton(
                              width: width,
                              height: height,
                              icon: Icon(
                                Icons.calendar_today,
                                color: ColorPalette.secondaryColor,
                              ),
                              text: _selectedDate == null
                                  ? 'Select date'
                                  : f.format(_selectedDate),
                              onButtonPressed: _selectDate,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            AddDescription(
              discontroller: _description,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.fromLTRB(width * 0.034, 0, width * 0.034, 5),
              height: height * 0.11,
              width: width * 0.928,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorPalette.solidWhite),
              child: AddAtachments(
                filename: _filename,
                load: _loadFile,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: height * 0.07,
              width: width * 0.94,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorPalette.primaryColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                onPressed: () {
                  bool added = _submit(context);
                  if (added) {
                    showAlertDialog(context, 'Task added successfully!', 1);
                  } else {
                    showAlertDialog(context, 'Can`t add this Task!', 0);
                  }
                },
                child: Center(
                  child: FittedBox(
                    child: const Text(
                      "Create New Task",
                      style: Styles.buttonTextStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: ExtractedNavigationBar(),
    );
  }
}
