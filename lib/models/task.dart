import 'dart:io';

import 'package:flutter/cupertino.dart';

class Task {
  final String assignedTo;
  final DateTime startDate;
  final DateTime endDate;
  final String tag;
  final String description;
  File attachment;
  bool isDone = false;

  Task({
    @required this.assignedTo,
    @required this.startDate,
    @required this.endDate,
    @required this.tag,
    @required this.description,
    this.isDone,
    this.attachment,
  });
}
