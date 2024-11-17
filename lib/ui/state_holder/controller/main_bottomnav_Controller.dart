
import 'package:flutter/cupertino.dart';

class MainBottomNavController with ChangeNotifier{
  int currentSelectedIndex = 0;

  void changeScreen(int index){
    currentSelectedIndex = index;
    notifyListeners();
  }

  void backtoHome(){
    changeScreen(0);
  }

  // void backtoService(){
  //   changeScreen(2);
  // }
}