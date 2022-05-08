// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:provider/provider.dart';

// import '../../views.dart';
// import 'todos_list_page_model.dart';

// class TodoListPage extends StatelessWidget {
//   const TodoListPage._({Key? key}) : super(key: key);

//   static Widget withDependencies({required BuildContext context}) {
//     return ChangeNotifierProvider(
//       create: (_context) => TodosListPageModel(
//         store: StoreProvider.of(context),
//       ),
//       child: const TodosListPage._(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider & Redux TODO'),
//       ),
//       body: const _Body(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showTodoAddDialog(context: context);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class _Body extends StatelessWidget {
//   const _Body({
//     key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<TodosListPageModel>(context);
//     final todos = viewModel.todos;
//     return ListView.builder(
//       itemCount: todos.length,
//       itemBuilder: (context, index) {
//         final todo = todos[index];
//         return Dissmisable(
//             key: Objectkey(todo),
//             onDismissed: (direction) {
//               viewModel.deleteAt(index);
//             },
//             child: Card(
//                 color: todo.isCompleted ? Colors.greenAccent : null,
//                 child: ListTile(
//                   title: Text(todo.name),
//                   onTap: () {
//                     viewModel.toggleComplete(index);
//                   },
//                   trailing: todo.isCompleted
//                       ? const Icon(
//                           Icons.done,
//                           color: Colors.green,
//                         )
//                       : null,
//                 )));
//       },
//     );
//   }
// }
