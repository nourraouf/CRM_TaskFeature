import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/models/task.dart';
import 'package:crm_task_feature/providers.dart/tasks.dart';
import 'package:crm_task_feature/widgets/Navigation_bar.dart';
import 'package:crm_task_feature/widgets/Select_button.dart';
import 'package:crm_task_feature/widgets/add_assigned.dart';
import 'package:crm_task_feature/widgets/add_attachments.dart';
import 'package:crm_task_feature/widgets/add_description.dart';
import 'package:crm_task_feature/widgets/custom_appbar.dart';
import 'package:crm_task_feature/widgets/custom_checkbox.dart';
import 'package:crm_task_feature/widgets/type_new_task.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  static const routeName = '/add task';
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = null;
  final _addFormKey = GlobalKey<FormState>();
  final f = new DateFormat('dd MMM yyyy');
  PlatformFile attachments = null;
  final _description = TextEditingController();
  final _subTask = TextEditingController();
  String filename = null;
  bool _submit(BuildContext context) {
    if (_addFormKey.currentState.validate() &&
        selectedDate != null &&
        attachments != null) {
      _addFormKey.currentState.save();
      Provider.of<Tasks>(context, listen: false).addTask(Task(
          assignedTo: '',
          description: _description.text,
          endDate: selectedDate,
          startDate: DateTime.now(),
          tag: ''));
      print(_description.text);
      _description.clear();
      _subTask.clear();
      attachments = null;
      selectedDate = null;
      return true;
    }
    print(_description.text);
    print(_subTask.text);
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
        attachments = file;
        setState(() {
          filename = file.name;
        });
      } else {
        // User canceled the picker
      }
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2022));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          print(selectedDate.toIso8601String());
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
            //type new task
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              height: height * 0.1,
              color: ColorPalette.solidWhite,
              child: TypeNewTask(
                f: f,
              ),
            ),
            //assigned
            AddAssigned(width: width, height: height),
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
                              text: 'Select date',
                              onButtonPressed: _selectDate,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            SelectButton(
                              width: width,
                              height: height,
                              icon: Icon(
                                Icons.track_changes_sharp,
                                color: ColorPalette.secondaryColor,
                              ),
                              text: 'Select tag',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text("Subtask", style: Styles.greyText2),
                    ),
                    Container(
                      height: height * 0.06,
                      child: Row(children: <Widget>[
                        CustomCheckbox(isChecked: false),
                        Container(
                            width: width * 0.8,
                            padding: const EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: _subTask,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'please enter a subtask';
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"[a-zA-Z]+\s"))
                              ],
                              cursorColor: ColorPalette.primaryColor,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "type to add more..."),
                            ))
                      ]),
                    ),
                  ],
                ),
              ),
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
                filename: filename,
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Task added successfully')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please enter avalid data')));
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
