import 'package:flutter/cupertino.dart';

class MyCounter extends ChangeNotifier
{
  int counter=0;
  inc ()
  {
    counter++;
    //any change happens ,it`ll tell consumers
    notifyListeners();
  }
}