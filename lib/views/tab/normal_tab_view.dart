import 'package:flutter/material.dart';

class NormalTabView extends StatelessWidget {
  const NormalTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Color.fromARGB(255, 30, 56, 77),
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
            ],
            selectedIndex: null,
          ),
          const Expanded(
              flex: 3,
              child: Center(
                child: Text("Normal tab view"),
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
