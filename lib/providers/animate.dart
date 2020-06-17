import 'package:flutter/material.dart';

class Animate with ChangeNotifier {
  bool showAnswer = false;
  AnimationController leadingController;
  AnimationController trailingController;

  void start() {
    if (showAnswer) {
      showAnswer = false;
      _reverse(controller: leadingController);
      _reverse(controller: trailingController);
    } else {
      showAnswer = true;
      _forward(controller: leadingController);
      _forward(controller: trailingController);
    }
    notifyListeners();
  }

  void _forward({AnimationController controller}) {
    if (controller != null) {
      controller.forward(from: 0.0);
    }
  }

  void _reverse({AnimationController controller}) {
    if (controller != null) {
      controller.reverse(from: 1.0);
    }
  }
}
