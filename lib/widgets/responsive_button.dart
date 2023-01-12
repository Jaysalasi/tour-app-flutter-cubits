// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  ResponsiveButton({
    this.isResponsive,
    this.width = 120,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: isResponsive == true
              ? const EdgeInsets.symmetric(horizontal: 15)
              : const EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? AppText(
                      text: text!,
                      color: Colors.white,
                    )
                  : Container(),
              Image.asset('assets/img/button-one.png'),
            ],
          ),
        ),
      ),
    );
  }
}
