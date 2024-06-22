import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ShowBook extends StatelessWidget {
  const ShowBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.we,
          height: 80.we,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.04),
              width: 1.we,
            ),
            image: DecorationImage(
              image: AssetImage(
                AppImages.bookPng,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        12.getW(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Kitob narxi",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
            ),
            Text(
              "100 000 so‘m",
              style: AppTextStyle.seoulRobotoBold.copyWith(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
