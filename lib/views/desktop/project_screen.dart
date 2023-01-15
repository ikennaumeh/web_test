import 'package:flutter/material.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(      
        child:  Text('Projects', style: TextStyle(fontSize: 80.sf),),
      ),
    );
  }
}