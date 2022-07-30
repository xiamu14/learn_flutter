import 'package:binder/binder.dart';
import 'package:flutter_100_day/entities/todo.dart';

final todoListRef = StateRef(const <Todo>[]);
final todoListFilterRef = StateRef(TodoListFilter.all);
final homeLoginRef = LogicRef((scope) => HomeLogic(scope));

class HomeLogic with Logic {
  HomeLogic(this.scope);
  @override
  final Scope scope;

  TodoListFilter get filter => read(todoListFilterRef);

  set filter(TodoListFilter value) => write(todoListFilterRef, value);

  void init() {
    write(todoListRef, [
      Todo(description: 'hello', id: 'todo-0'),
      Todo(description: 'hello', id: 'todo-1'),
      Todo(description: 'hello', id: 'todo-2'),
      Todo(description: 'hello', id: 'todo-3'),
      Todo(description: 'hello', id: 'todo-4'),
    ]);
  }

  void add(String description) {
    _updateTodos(
      (list) => [
        ...list,
        Todo(description: description),
      ],
    );
  }

  void toggle(String id) {
    _updateTodo(
      id,
      (todo) => Todo(
        id: todo.id,
        description: todo.description,
        completed: !todo.completed,
      ),
    );
  }

  void edit({required String id, required String description}) {
    _updateTodo(
      id,
      (todo) => Todo(
        id: todo.id,
        description: description,
        completed: todo.completed,
      ),
    );
  }

  void remove(String id) {
    _updateTodos(
      (list) => [
        for (final Todo todo in list)
          if (todo.id != id) todo,
      ],
    );
  }

  void _updateTodos(List<Todo> Function(List<Todo>) updater) {
    update(todoListRef, updater);
  }

  void _updateTodo(String id, Todo Function(Todo) updater) {
    _updateTodos(
      (List<Todo> list) => [
        for (final Todo todo in list)
          if (todo.id == id) updater(todo) else todo,
      ],
    );
  }
}
