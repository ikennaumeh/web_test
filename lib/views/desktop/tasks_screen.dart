import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:web_test/core/app_model.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';
import 'package:web_test/core/models/task_model.dart';
import 'package:web_test/generated/l10n.dart';
import 'package:web_test/views/desktop/task_details_screen.dart';
import 'package:web_test/views/locations.dart/task_details_location.dart';
import 'package:web_test/views/widgets/task_button.dart';

class TaskScreen extends ConsumerWidget {
  TaskScreen({super.key});

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> taskList = ref.watch(taskProviderModel);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    S.of(context).tasks,
                    style: TextStyle(
                      fontSize: 24.sf,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 8, 79, 138),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListView.builder(
                    itemCount: taskList.length,
                    shrinkWrap: true,
                    itemBuilder: (c, i) {
                      final task = taskList.elementAt(i);
                      return TaskButton(
                        beamer: _beamerKey,
                        uri: "/tasks/${++i}",
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(task.title), Text(Jiffy(task.date).format("yy/MM  hh:mm"))]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          (context.currentBeamLocation.state as BeamState).uri.path.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('Empty'),
                  ),
                )
              : Expanded(
                  child: Beamer(
                    key: _beamerKey,
                    routerDelegate: BeamerDelegate(
                      initialPath: "/tasks/1",
                      transitionDelegate: const NoAnimationTransitionDelegate(),
                      locationBuilder: (routeInformation, _) => TaskDetailsLocation(routeInformation),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
