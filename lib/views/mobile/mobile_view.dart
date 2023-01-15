import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:web_test/core/app_model.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';
import 'package:web_test/core/models/task_model.dart';
import 'package:web_test/generated/l10n.dart';
import 'package:web_test/views/desktop/project_screen.dart';
import 'package:web_test/views/desktop/task_details_screen.dart';
import 'package:web_test/views/desktop/team_screen.dart';
import 'package:web_test/views/locations.dart/task_details_location.dart';
import 'package:web_test/views/widgets/task_button.dart';

class MobileView extends ConsumerWidget {
  MobileView({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _beamerKey = GlobalKey<BeamerState>();

  Locale? locale;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> taskList = ref.watch(taskProviderModel);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: locale,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(6),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                items: ref.read(appModelProvider.notifier).languages.map<DropdownMenuItem<Locale>>((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item.languageCode,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  ref.read(appModelProvider.notifier).setLanguage(value);
                },
                hint: Text(
                  S.of(context).select_language,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.home),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(S.of(context).tasks),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProjectScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(S.of(context).projects),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Beamer.of(context).beamToNamed("/teams/",);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.people),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(S.of(context).teams),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (c, i) {
          final task = taskList.elementAt(i);
          return GestureDetector(
            onTap: () {
              Beamer.of(context).beamToNamed("/tasks/${task.id}",);
            },
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20.scale),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(task.title), Text(Jiffy(task.date).format("yy/MM  hh:mm"))]),
            ),
          );
        },
      ),
    );
  }
}

class MobileTaskDetailsScreen extends ConsumerWidget {
  final int taskId;
  const MobileTaskDetailsScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> taskList = ref.watch(taskProviderModel);
    Task task = taskList.firstWhere((element) => element.id == taskId.toString());
    return Scaffold(
      body: Expanded(
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
                task.title,
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
              Text(Jiffy(task.date).format("yy/MM  hh:mm")),
              const SizedBox(
                height: 2,
              ),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 18.sf,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
