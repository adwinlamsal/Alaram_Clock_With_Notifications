import 'package:alaram/Model/Model.dart';
import 'package:flutter/cupertino.dart';

class alarmprovider extends ChangeNotifier{



List<model> modelist=[];



SetAlaram(String label,DateTime dateTime,bool check){

modelist.add(model(label, dateTime,check));
notifyListeners();


}



CheckAlarm(int index,bool check){

modelist[index].check=check;
notifyListeners();

}







}