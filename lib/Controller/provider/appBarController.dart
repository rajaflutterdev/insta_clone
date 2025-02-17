import 'package:flutter/material.dart';

class appBarData extends ChangeNotifier{

  String typeData='';


  changeTappedFunc({type}){
    typeData=type;
    notifyListeners();
  }



}