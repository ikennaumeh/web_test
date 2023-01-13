import 'package:flutter/material.dart';

class LargeTabView extends StatelessWidget {
  const LargeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.blue,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
            ],
            selectedIndex: null,
          ),
          const Expanded(
              flex: 3,
              child: Center(
                child: Text("Large tab view"),
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