import 'package:flutter/material.dart';
import 'dart:async';

class PageTimerProvider extends ChangeNotifier {
  int _activePage = -1; // No active page initially
  Map<int, String> _timersText = {
    for (int i = 0; i < 5; i++) i: 'Tap to start', // Initialize timer texts for 5 pages
  };
  Map<int, Timer?> _activeTimers = {
    for (int i = 0; i < 5; i++) i: null, // Initialize active timers for 5 pages
  };

  void startTimer(int pageIndex) {
    // Cancel and reset the old timer if there is one
    if (_activePage != -1 && _activePage != pageIndex) {
      _activeTimers[_activePage]?.cancel();
      _timersText[_activePage] = 'Tap to start';
    }

    // Set the new active page
    _activePage = pageIndex;
    // Cancel any existing timer on the new page before starting a new one
    _activeTimers[pageIndex]?.cancel();
    // Start the "Ready", "Set", "Go" sequence for the new page
    _prepareCountdown(pageIndex);
    notifyListeners();
  }

  void _prepareCountdown(int pageIndex) {
    _timersText[pageIndex] = 'Ready';
    notifyListeners();

    var timer = Timer(Duration(seconds: 1), () {
      if (_activePage == pageIndex) { // Check if still active
        _timersText[pageIndex] = 'Set';
        notifyListeners();

        var timer2 = Timer(Duration(seconds: 1), () {
          if (_activePage == pageIndex) { // Check if still active
            _timersText[pageIndex] = 'Go';
            notifyListeners();
            // Start countdown after 'Go'
            _countdown(pageIndex);
          }
        });
        _activeTimers[pageIndex] = timer2;
      }
    });
    _activeTimers[pageIndex] = timer;
  }

  void _countdown(int pageIndex) {
    int count = 60;
    Timer? countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_activePage != pageIndex) {
        timer.cancel();
        return;
      }

      if (count > 0) {
        _timersText[pageIndex] = count.toString();
        count--;
      } else {
        _timersText[pageIndex] = 'Done';
        timer.cancel();
      }
      notifyListeners();
    });

    _activeTimers[pageIndex] = countdownTimer;
  }

  String getTimerText(int pageIndex) => _timersText[pageIndex] ?? 'Tap to start';

  @override
  void dispose() {
    // Cancel all active timers when the provider is disposed
    _activeTimers.forEach((key, timer) {
      timer?.cancel();
    });
    super.dispose();
  }
}
