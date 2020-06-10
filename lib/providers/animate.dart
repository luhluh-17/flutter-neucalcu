import 'package:flutter/material.dart';

class Animate with ChangeNotifier {
  bool showAnswer = false;
  AnimationController leadingController;
  AnimationController trailingController;

  startAnimation({AnimationController controller}) {
    if (controller != null) {
      controller.forward(from: 0.0);
      notifyListeners();
    }
  }

  reverseAnimation({AnimationController controller}) {
    if (controller != null) {
      controller.reverse(from: 1.0);
      notifyListeners();
    }
  }
}
