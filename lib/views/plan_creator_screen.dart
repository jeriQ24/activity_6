
import 'package:activity_6/plan_provider.dart';
import 'package:activity_6/views/plan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key, required PlanScreen child});

  @override
  State<PlanCreatorScreen> createState() => PlanCreatorScreenState();
}

class PlanCreatorScreenState extends State<PlanCreatorScreen> {

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }


  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans')),
      body: Column(children: <Widget>[
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }

  //construct a text field and calls function to add a plan when enter is tapped
  Widget _buildListCreator() {
    void addPlan() {
      final text = textController.text;
      if (text.isEmpty) {
        return;
      }
      final plan = Plan()..name=text;
      PlanProvider.of(context).add(plan);
      textController.clear();
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() {
        
      });

    }

    Widget _buildMasterPlans() {
      //access the plans data
      final plans = PlanProvider.of(context);
      if (plans.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Icon(Icons.note, size: 100, color: Colors.grey),
            Text('You do not have any plans yet.',
            style: Theme.of(context).textTheme.headline5)
          ],
        );
      }

      return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return ListTile(
            title: Text(plan.completenessMessage),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PlanScreen(plan: plan)
                )
              );
            }
          );
        }


      );


    }


    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20)),
            onEditingComplete: addPlan),
          )
        );
      

  }


}