import 'package:countdown/provider/page_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownPage extends StatelessWidget {
  final int pageIndex;

  const CountdownPage({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageTimerProvider>(
      builder: (context, timerProvider, child) {
        return GestureDetector(
          onTap: () => timerProvider.startTimer(pageIndex),
          child: Container(
            color: Colors.grey[200], // Background color
            alignment: Alignment.center,
            child: Text(
              '${timerProvider.getTime(pageIndex)}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
