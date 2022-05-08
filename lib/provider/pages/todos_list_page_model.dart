// import 'package:flutter/material.dart';
// import 'package:redux/redux.dart';

// extension _TodosListPageModalState on AppState {
//   bool changedInTodos({
//     required List<Todo>? todos,
//   }) =>
//       todosState.todos != todos;
// }

// class TodosListPageModal extends ChangeNotifier with AutoCancelSubscriberMixin {
//   TodosListPageModal({required Store<AppState> store}) : _store = store {
//     _initialize();
//   }

//   final Store<AppState> _store;

//   List<Todo> get todos => todos ?? [];
//   List<Todo>? _todos;

//   void deleteAt(int index) {
//     _store.dispatch(TodoDeleteAction(todos[index].id));
//   }

//   void toggleComplete(int index) {
//     _store.dispatch(TodoToggleCompletionAction(todos[index].id));
//   }

//   void _initialize() {
//     _todos = _store.state.todosState.todos;
//     subscriber.addSubscription(_store.onChange.listen((state) {
//       if (state.changedInTodos(todos: todos)) {
//         _todos = state.todosState.todos;
//         notifyListener();
//       }
//     }));
//   }
// }
