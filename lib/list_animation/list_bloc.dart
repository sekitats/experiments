import 'package:rxdart/rxdart.dart';

class ListBloc {
  static late final ListBloc _listBloc = ListBloc._();

  factory ListBloc() {
    return _listBloc;
  }

  late PublishSubject<int> _positionItem;

  ListBloc._() {
    _positionItem = PublishSubject<int>();
  }

  Stream<int> get listenAnimation => _positionItem.stream;

  void startAnimation(int limit, Duration duration) async {
    for (var i = 0; i < limit; i++) {
      await Future.delayed(duration, () {
        _updatePosition(i);
      });
    }
  }

  void _updatePosition(int position) {
    _positionItem.add(position);
  }

  // void dispose() {
  // _listBloc.dispose();
  // _positionItem.close();
  // super.dispose();
  // }
}
