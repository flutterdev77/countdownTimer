import 'package:countdown/view/countdown_page.dart';
import 'package:flutter/material.dart';

class PagerSetup extends StatelessWidget {
  const PagerSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: List.generate(
            5,
            (index) => Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top,
                    ),
                    Text(
                      'Page : $index',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CountDownPage(pageIndex: index),
                    const Spacer(),
                  ],
                )),
      ),
    );
  }
}
