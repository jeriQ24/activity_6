import 'package:activity_6/models/plan.dart';
import 'package:activity_6/views/plan_creator_screen.dart';
import 'package:activity_6/views/plan_screen.dart';
import "package:flutter/material.dart";
import 'plan_provider.dart';

void main() =>(const MasterPlanApp());


class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PlanCreatorScreen(
        child: PlanScreen()
      ),
      ),
    );
  }
}

//unit5_2 Page 43