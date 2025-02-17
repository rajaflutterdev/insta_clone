import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';

class cameraScreen extends StatefulWidget {
  const cameraScreen({super.key});

  @override
  State<cameraScreen> createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: FadeIn(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: customText(textName: 'Camera')));
  }
}
