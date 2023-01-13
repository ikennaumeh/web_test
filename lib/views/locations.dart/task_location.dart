import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/desktop/small_desktop_view.dart';

class TasksLocation extends BeamLocation<BeamState> {
  TasksLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/tasks/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('tasks'),
          title: 'Tasks',
          child: TaskScreen(),
        )
      ];
}