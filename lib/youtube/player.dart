import 'package:flutter/material.dart';

class Player extends ChangeNotifier {
  late int start;
  late int end;
  late double playbackSpeed;

  void updateStartPos(value) {
    start = value;
    notifyListeners();
  }

  void updateEndPos(value) {
    end = value;
    notifyListeners();
  }

  void updatePlaybackSpeed(value) {
    playbackSpeed = value;
    notifyListeners();
  }
}
