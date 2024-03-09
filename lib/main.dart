import 'package:countdown/provider/page_timer_provider.dart';
import 'package:countdown/view/pager_setup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageTimerProvider(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: PagerSetup(),
      ),
    );
  }
}
