import 'package:countdown/provider/page_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownPage extends StatelessWidget {
  const CountDownPage({
    required this.pageIndex,
    super.key,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<PageTimerProvider>(
      builder: (context, timerProvider, child) {
        TimerData data = timerProvider.getTimerData(pageIndex);
        return GestureDetector(
          onTap: () => timerProvider.startTimer(pageIndex),
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text(
                data.display,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
