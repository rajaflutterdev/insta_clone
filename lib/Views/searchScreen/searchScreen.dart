import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

import '../../customWidgets/customText/customText.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: FadeIn(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: customText(textName: "Search")));
  }
}
