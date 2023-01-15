import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:web_test/core/app_model.dart';
import 'package:web_test/core/extensions/number_scaler_ext.dart';
import 'package:web_test/core/models/task_model.dart';

class TaskDetailsScreen extends ConsumerWidget {
  final int? taskId;
  const TaskDetailsScreen({super.key, this.taskId,});

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
  }
}
