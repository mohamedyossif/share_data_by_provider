import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/counter.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<MyCounter>(
          builder: (context, mycounter, w) =>
              Text("${mycounter.counter} times"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyCounter>(
              builder: (context, mycounter, w) => Text(
                "counter = ${mycounter.counter}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
