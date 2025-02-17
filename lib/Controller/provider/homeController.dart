import 'package:flutter/cupertino.dart';


class homeContent extends ChangeNotifier {


  double sliderIndex=0;
  double commentCount=10;
  double likeCount=10;
  double shareCount=10;
  String postDescription= "The contents of this e-mail and any attachment(s) are confidential and intended for the named recipient(s) only. E-mail transmission is not guaranteed to be secure or error-free as information could be intercepted, corrupted, lost, destroyed, arrive late or incomplete, or may contain viruses in transmission. The e-mail and its contents (with or without referred errors) shall therefore not attach any liability on the originator or Trioangle or its affiliates. Views or opinions, if any, presented in this email are solely those of the author and may not necessarily reflect the views or opinions of Trioangle or its affiliates. Any form of reproduction,";



  updateTheCount({type}) {
    switch (type) {
      case 'comment':
        commentCount++;
        break;
      case 'like':
        likeCount++;
        break;
      case 'share':
        shareCount++;
        break;
    }

    notifyListeners();
  }

  String formatNumber({required double value}) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  updateCarousalCount({index}){

    sliderIndex=double.parse(index.toString());
    notifyListeners();

  }

}
