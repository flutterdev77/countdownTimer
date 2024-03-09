import 'package:flutter/material.dart';
import 'dart:async';

class PageTimerProvider with ChangeNotifier {
  Map<int, TimerData> _timersData = {};

  TimerData getTimerData(int pageIndex) =>
      _timersData.putIfAbsent(pageIndex, () => TimerData());

  void startTimer(int pageIndex) {
    TimerData data = getTimerData(pageIndex);
    data.display = "Ready";
    notifyListeners();
    data.timer?.cancel(); // Cancel any existing timer
    Future.delayed(const Duration(seconds: 1), () {
      data.display = "Set";
      notifyListeners();

      Future.delayed(const Duration(seconds: 1), () {
        data.display = "Go";
        notifyListeners();
        Future.delayed(const Duration(seconds: 1), () {
          data.display = data.start.toString();
          notifyListeners();
          data.timer =
              Timer.periodic(const Duration(seconds: 1), (Timer timer) {
            if (data.start == 0) {
              data.timer?.cancel();
              data.display = 'Done!';
              notifyListeners();
            } else {
              data.start--;
              data.display = data.start.toString();
              notifyListeners();
            }
          });
        });
      });
    });

    // Stop other timers
    _timersData.forEach((index, timerData) {
      if (index != pageIndex) {
        timerData.timer?.cancel();
        if (timerData.display != 'Tap to start') {
          timerData.display = 'Tap to start';
          notifyListeners();
        }
      }
    });

    _timersData[pageIndex] = data;
  }
}

class TimerData {
  Timer? timer;
  int start = 60;
  String display = 'Tap to start';
}
