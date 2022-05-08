// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';


// class ReduxSample extends StatefulWidget {
//   const ReduxSample({Key? key}) : super(key: key);

//   @override
//   State<ReduxSample> createState() => _ReduxSampleState();
// }

// class _ReduxSampleState extends State<ReduxSample> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Redux Todo'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showTodoAddDialog(context: context),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//       body: StoreConnecter<AppState, _ViewModel>(
//         converter: (state) => _ViewModel.fromStore(store),
//         builder: (context, viewModel) {
//           fianl todos = viewModel.todos;
//           return ListView.bulider(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               final todo = todos[index];
//               return Dismissible(key: ObjectKey(todo),
//                 onDismissed: (direction) {
//                   viewModel.deleteAt(index);
//                 },
//                child: Card(
//                  color: todo.isCompleted ? Colors.greenAccent : null,
//                  child: ListTile(
//                    title: Text(todo.name),
//                    onTap() {
//                      viewModel.toggleComplete(index);
//                    },
//                    trailing: todo.isCompleted ? const Icon(Icons.done, color: Colors.green,) : null,
//                  ),
//                )
//                );
//             }
//           );
//         },
//       ),
//     );
//   }

//   showTodoAddDialog({BuildContext context}) {}
// }

// class _ViewModel {
//   _ViewModel.fromStore(Store<AppState> store)
//   : _store = store,
//   todos = store.state.todosState.todos;

//   final List<Todo> todos;

//   final Store<AppStore> _store;

//   @override
//   bool operator ==(other) {
//     if (other is _ViewModel) {
//       if (other.todos == todos) {
//         return true;
//       }
//       if (other.todos.length != todos.length) {
//         return false;
//       }
//       for (var i = 0; i < todos.length; i++) {
//         if (other.todos[index] != todos[index]) {
//           return false;
//         }
//       }
//         return true;
//     }
//     return false;
//   }

//   void deleteAt(int index) {
//     _store.dispatch(TodoDeleteAction(todo[index].id));
//   }

//   void toggleComplete(int index) {
//     _store.dispatch(TodoToggleCompletionAction(todos[index].id));
//   }


// }