import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class GlobalMyButton extends StatelessWidget {
  const GlobalMyButton({
    super.key,
    required this.onTab,
    required this.title,
    this.margin,
    this.backgroundColor,
    this.titleColor,
    this.iconPath,
  });

  final VoidCallback? onTab;
  final String title;
  final String? iconPath;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ?? EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 17.he),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          backgroundColor: backgroundColor ?? AppColors.cF07448,
        ),
        onPressed: onTab,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null)
              SvgPicture.asset(
                iconPath!,
                width: 24.we,
                height: 24.we,
              ),
            Text(
              title,
              style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                fontSize: 16.sp,
                color: titleColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
