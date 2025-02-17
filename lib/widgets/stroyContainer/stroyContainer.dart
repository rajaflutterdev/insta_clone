import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';

class stroyContainer extends StatefulWidget {
  double? elevation;
  double? height;
  double? width;
  Widget ?child;
  BorderRadius? radius;
  Color? boxColor;
  BoxDecoration ? decoration;
  LinearGradient ?gradient;
  Color ?primaryColor;
  Color ?midColor;
  Color ?secondaryColor;
  VoidCallback onTap;

  stroyContainer({
    this.radius,
     this.child,
    this.elevation,
    this.width,
    this.gradient,
    this.primaryColor,
    this.secondaryColor,
    this.midColor,
    this.height,
    this.decoration,
    this.boxColor,
     required this.onTap
  });

  @override
  State<stroyContainer> createState() => _stroyContainerState();
}

class _stroyContainerState extends State<stroyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(15),
        dashPattern: [ 8,8],
        color: Colors.grey,
        strokeCap: StrokeCap.round,
        strokeWidth: 3,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Material(
            elevation: widget.elevation??8,
            borderRadius: widget.radius??BorderRadius.circular(15),
            color: widget.boxColor??whiteColor,
            child: Container(
              height:widget.height??50,
              width:widget.width??50,
              decoration: widget.decoration??BoxDecoration(
                color: widget.boxColor??whiteColor,
                borderRadius: widget.radius??BorderRadius.circular(15),
                gradient: widget.gradient??
                    LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          widget.midColor??storyMidColor,
                          widget.primaryColor??storyPrimaryColor,
                ]),
              ),
              child: Center(
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
