import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    required this.onTab,
    required this.active,
     this.title,
    this.iconPath,
    this.padding,
  });

  final VoidCallback onTab;
  final bool active;
  final String? title;
  final String? iconPath;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 15.we,
              vertical: 13.he,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
          side: active
              ? BorderSide(
                  color: AppColors.cF07448,
                  width: 1.we,
                )
              : const BorderSide(color: Colors.transparent),
        ),
        backgroundColor: AppColors.cF07448.withOpacity(0.08),
      ),
      onPressed: onTab,
      child: iconPath == null
          ? Text(
              title ?? "",
              style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                color: active
                    ? AppColors.c010A27
                    : AppColors.c010A27.withOpacity(0.4),
                fontSize: 16.sp,
              ),
            )
          : SvgPicture.asset(
              iconPath!,
              width: 24.we,
              height: 24.we,
            ),
    );
  }
}
