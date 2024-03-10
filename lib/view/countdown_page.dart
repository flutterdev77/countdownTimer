import 'package:countdown/provider/page_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({
    required this.pageIndex,
    super.key,
  });

  final int pageIndex;

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  int countDown = 60;

  @override
  Widget build(BuildContext context) {
    return Consumer<PageTimerProvider>(
      builder: (context, timerProvider, child) {
        TimerData data =
            timerProvider.getTimerData(widget.pageIndex, countDown);
        countDown = data.start;
        return GestureDetector(
          onTap: () => timerProvider.startTimer(widget.pageIndex, countDown),
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
