import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/counter.dart';
import 'package:provider1/second.dart';

main() => runApp(MyApp());

// idea: share data between two screen by provider(simple idea)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCounter(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Consumer<MyCounter>(
            builder: (context, mycounter, w) =>
                Text("${mycounter.counter} times"),
          ),
          title: Text(
            "Home Screen",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward,size: 35,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Second()));
            },
          ),
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
            SizedBox(
              height: 40,
            ),
            Consumer<MyCounter>(
              builder: (context, mycounter, w) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    mycounter.inc();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
