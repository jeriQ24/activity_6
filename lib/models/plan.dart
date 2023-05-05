import '../views/plan_screen.dart';
import 'task.dart';
import 'package:flutter/cupertino.dart';

class Plan {
  String name = '';
  final List<Task> task = [];
  //method to show progress on every plan
  int get completeCount => task
    .where((task) => task.complete!)
    .length;
  String get completenessMessage =>
  '$completeCount out of ${task.length} task';



}

