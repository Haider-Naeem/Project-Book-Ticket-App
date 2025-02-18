import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  final bool? isColor;
  const AppColumnLayout({super.key, required this.firstText,
    required this.secondText, required this.alignment, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      //style:isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
      children: [
        Text(firstText,style:isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3,),
        Gap(5),
        Text(secondText,style:isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
      ],
    );
  }
}
