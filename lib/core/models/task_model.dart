import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_model.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    required DateTime date,
  }) = _Task;
}
