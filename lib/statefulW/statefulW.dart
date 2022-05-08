import 'package:experiments/statefulW/views/widget/dialogs/todo_add_dialog.dart';
import 'package:flutter/material.dart';
import './models/todo.dart';

void main() {
  runApp(const StatefulWidgetSample());
}

@immutable
class StatefulWidgetSample extends StatelessWidget {
  const StatefulWidgetSample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOアプリ'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            final todo = _todos[index];
            return Dismissible(
              child: Card(
                child: ListTile(
                  title: Text(todo.name),
                  onTap: () {
                    setState(() {
                      _todos[index] =
                          Todo(isCompleted: !todo.isCompleted, name: todo.name);
                    });
                  },
                  trailing: todo.isCompleted
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : null,
                ),
                color: todo.isCompleted ? Colors.greenAccent : null,
              ),
              key: ObjectKey(todo),
              onDismissed: (direction) {
                setState(() {
                  _todos.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showTodoAddDialog(
                context: context,
                onAdd: (name) {
                  setState(() {
                    _todos.insert(0, Todo(name: name));
                  });
                });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add)),
    );
  }
}
