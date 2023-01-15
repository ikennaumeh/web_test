

import 'package:web_test/core/models/task_model.dart';

class NetworkService{

  NetworkService();

  List<Task> listOfTasks = [
    Task(id: "1", title: "Complete assessment", description: "Make sure to complete assessment", date: DateTime.now()),
    Task(id: "2", title: "Complete test", description: "Make sure to complete test", date: DateTime.now()),
    Task(id: "3", title: "Read books", description: "Make sure to read books", date: DateTime.now()),
    Task(id: "4", title: "Write tests", description: "Make sure to write tests", date: DateTime.now()),
  ];

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return listOfTasks;
  }
}