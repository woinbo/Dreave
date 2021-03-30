import 'dart:async';

import '../utils/state_abstract_control.dart';

class StateControl implements StateAbstractControl {
  final StreamController streamController;

  StateControl() : streamController = StreamController();

  void notifyListeners() {
    streamController.add('change');
  }

  void init() {}

  void dispose() {
    streamController.close();
  }
}
