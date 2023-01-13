import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/desktop/small_desktop_view.dart';

class TaskDetailsLocation extends BeamLocation<BeamState> {
  TaskDetailsLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/tasks/:tasksId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        
        if (state.pathPatternSegments.contains(':tasksId') && state.pathParameters['tasksId'] != null)          
           BeamPage(
            key: const ValueKey('tasks-details'),
            title: 'Task Details',
            child: TaskDetailsScreen(taskId: int.tryParse(state.pathParameters['tasksId'].toString()),),
          ),
        
      ];
}