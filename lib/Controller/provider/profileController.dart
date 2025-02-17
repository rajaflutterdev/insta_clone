import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profileContent extends ChangeNotifier{

  var selectedItemIndex;
  int selectedPostItem=0;

  List favIconData=[
    FontAwesomeIcons.cakeCandles,
    FontAwesomeIcons.clock,
    FontAwesomeIcons.football,
    FontAwesomeIcons.paypal,
    FontAwesomeIcons.globeAmericas,
    FontAwesomeIcons.faceAngry,
    FontAwesomeIcons.faceAngry,
    FontAwesomeIcons.faceAngry,
    FontAwesomeIcons.faceAngry,
    FontAwesomeIcons.faceAngry,
  ];


  List<String> postContentText=[
   "All",
    "Stories",
    "Saved"
  ];

  postContentSelectedFunc({index}){
    selectedPostItem=index;
    notifyListeners();
  }
  selectItem({index}){
    selectedItemIndex=index;
    notifyListeners();
  }

}