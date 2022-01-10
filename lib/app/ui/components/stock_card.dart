import 'package:finance_app/app/theme/app_theme.dart';
import 'package:finance_app/app/theme/text_style_theme.dart';
import 'package:finance_app/app/ui/components/box_initials.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  StockCard({
    Key? key,
    required this.width,
    required this.height,
    required this.initials,
    required this.name,
    required this.price,
    required this.boxInitialColor
  }) : super(key: key);

  final double width;
  final double height;
  final String initials;
  final String name;
  final String price;
  final Color boxInitialColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: height * 0.15,
      decoration: BoxDecoration(
          color: AppTheme.dark3,
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: AppTheme.green1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 15),
          BoxInitials(
            width: width,
            height: height,
            initials: initials,
            boxInitialColor: boxInitialColor,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                initials,
                style: TextStyleTheme.title2,
              ),
              Text(
                name,
                style: TextStyleTheme.title3,
              )
            ],
          ),
          SizedBox(
            width: 90,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "R\$: $price",
              style: TextStyleTheme.title1,
            ),
          )
        ],
      ),
    );
  }
}
