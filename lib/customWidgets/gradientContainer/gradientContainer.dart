import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../untils/homeScreenUntils/homeScreenUntils.dart';

class gradientContainer extends StatefulWidget {
  Widget? child;
  double? height;
  double? width;
  VoidCallback? onTap;
  bool? bgColorShow;

  gradientContainer({
    this.child,
    this.height,
    this.width,
    this.onTap,
    this.bgColorShow,
  });

  @override
  State<gradientContainer> createState() => _gradientContainerState();
}

class _gradientContainerState extends State<gradientContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        height: widget.height ?? 50,
        width: widget.width ?? 50,
        decoration: BoxDecoration(
          color:widget.bgColorShow==true?whiteColor: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          gradient: widget.bgColorShow==true? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                storyMidColor,
                storyPrimaryColor,
              ]):null,
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
