import 'package:finance_app/app/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

class BoxInitials extends StatelessWidget {
  const BoxInitials({
    Key? key,
    required this.width,
    required this.height,
    required this.initials,
    required this.boxInitialColor
  }) : super(key: key);

  final double width;
  final double height;
  final String initials;
  final Color boxInitialColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.18,
      height: height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: boxInitialColor,
      ),
      child: Text(initials, style: TextStyleTheme.title1,),
      alignment: Alignment.center,
    );
  }
}
