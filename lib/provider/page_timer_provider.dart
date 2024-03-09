import 'package:flutter/material.dart';

class PageTimerProvider extends ChangeNotifier {
  // Map of page index to countdown value
  final Map<int, int> _timers = {0: 60, 1: 60, 2: 60, 3: 60, 4: 60};
  int _activePage = 0;

  void startTimer(int pageIndex) {
    _activePage = pageIndex;
    notifyListeners();
    _timers.forEach((index, value) {
      if (index != pageIndex) {
        _timers[index] = 60; // Reset other timers to initial value
      }
    });
    _timers[pageIndex] ??= 60; // Ensure timer exists
    _tick(pageIndex);
  }

  void _tick(int pageIndex) {
    Future.delayed(const Duration(seconds: 1), () {
      if (_timers[pageIndex]! > 0 && _activePage == pageIndex) {
        _timers[pageIndex] = _timers[pageIndex]! - 1;
        notifyListeners();
        _tick(pageIndex); // Recursive call
      }
    });
  }

  int getTime(int pageIndex) => _timers[pageIndex] ?? 60;
}
