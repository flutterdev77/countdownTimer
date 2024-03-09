import 'package:countdown/provider/page_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownPage extends StatelessWidget {
  const CountDownPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<PageTimerProvider>(builder: (context, timer, child) {
      return GestureDetector(
        onTap: () => timer.startTimer(pageIndex),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              timer.getTimerText(pageIndex),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }
}
