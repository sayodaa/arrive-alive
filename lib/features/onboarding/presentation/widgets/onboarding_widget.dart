import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    this.title1,
    this.title2,
    required this.desc,
    this.imageWidth = 280,
    this.imageHeight = 200,
    this.titleSpacing = 10,
    this.textSpacing = 30,
    this.textWidth = 300,
    this.heightText,
  });

  final String? title1, title2;
  final String image, desc;
  final double imageWidth, imageHeight;
  final double titleSpacing, textSpacing, textWidth;
  final double? heightText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: imageWidth, height: imageHeight),
          SizedBox(height: titleSpacing),
          SizedBox(
           height:  heightText ?? 0,
            child: Text(title1 ?? '', style: AppStyles.font31W700),
          ),
          SizedBox(
            height: heightText ?? 0,
            child: Text(
              title2 ?? '',
              style: AppStyles.font31W700.copyWith(color: AppColors.primary),
            ),
          ),
          SizedBox(height: textSpacing),
          SizedBox(
            width: textWidth,
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: AppStyles.font14W100,
            ),
          ),
        ],
      ),
    );
  }
}
