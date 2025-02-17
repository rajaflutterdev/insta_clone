import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';

class favouriteScreen extends StatefulWidget {
  const favouriteScreen({super.key});

  @override
  State<favouriteScreen> createState() => _favouriteScreenState();
}

class _favouriteScreenState extends State<favouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: FadeIn(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: customText(textName: 'Favoutite')));
  }
}
