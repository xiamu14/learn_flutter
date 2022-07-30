import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Todo {
  Todo({
    String id = '',
    required this.description,
    this.completed = false,
  });

  final String id = _uuid.v4();
  final String description;
  final bool completed;

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}

enum TodoListFilter { all, active, completed }
