import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:web_test/views/mobile/mobile_view.dart';

class MobileTaskDetailsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/tasks/:tasksId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = <BeamPage>[];
    final String? taskIdParameter = state.pathParameters['tasksId'];
    final taskId = int.tryParse(taskIdParameter!);
    pages.add(
      BeamPage(
        key: const ValueKey('tasks-details'),
        title: 'Task Details',
        child: MobileTaskDetailsScreen(taskId: taskId!),
      ),
    );
    return pages;
  }
}
