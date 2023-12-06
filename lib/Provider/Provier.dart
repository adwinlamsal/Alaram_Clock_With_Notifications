import 'dart:convert';

import 'package:alaram/Model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class alarmprovider extends ChangeNotifier{

late SharedPreferences preferences;

List<Model> modelist=[];

List<String> listofstring=[];



SetAlaram(String label,String dateTime,bool check,String repeat){

modelist.add(Model(label: label, dateTime: dateTime, check: check, when: repeat));
notifyListeners();


}



CheckAlarm(int index,bool check){

modelist[index].check=check;
notifyListeners();

}



GetData()async{

preferences=await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("data");

    modelist = cominglist!.map((e) => Model.fromJson(json.decode(e))).toList();
notifyListeners();

}





SetData(){


listofstring = modelist.map((e) => json.encode(e.toJson())).toList();
preferences.setStringList("data", listofstring);

notifyListeners();

}
}

