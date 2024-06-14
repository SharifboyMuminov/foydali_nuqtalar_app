import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class CostumeSliderTextSize extends StatelessWidget {
  const CostumeSliderTextSize({
    super.key,
    required this.textStyle,
    required this.onChanged,
  });

  final TextStyle textStyle;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shrift hajmi",
            style: AppTextStyle.seoulRobotoMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.c010A27,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Slider.adaptive(
                  mouseCursor: MouseCursor.defer,
                  autofocus: true,
                  thumbColor: AppColors.cF07448,
                  activeColor: AppColors.cF07448,
                  inactiveColor: AppColors.c010A27.withOpacity(0.08),
                  value: textStyle.fontSize ?? 16,
                  min: 14,
                  max: 32.sp,
                  divisions: 30,
                  label: (textStyle.fontSize ?? 16).round().toString(),
                  onChanged: onChanged,
                ),
              ),
              10.getW(),
              Text(
                (textStyle.fontSize ?? 16).round().toString(),
                style: AppTextStyle.seoulRobotoMedium.copyWith(
                  color: AppColors.c010A27,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
