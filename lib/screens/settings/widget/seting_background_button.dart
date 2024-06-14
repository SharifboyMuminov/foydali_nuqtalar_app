import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SetBackgroundColorMyButton extends StatelessWidget {
  const SetBackgroundColorMyButton({
    super.key,
    required this.onTab,
    required this.active,
    this.backgroundColor,
  });

  final VoidCallback onTab;
  final bool active;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.he),
        backgroundColor: backgroundColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
          side: active
              ? BorderSide(color: AppColors.cF07448, width: 1.we)
              : const BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Aa",
            style: AppTextStyle.seoulRobotoRegular.copyWith(
              color: AppColors.c010A27,
              fontSize: 16.sp,
            ),
          ),
          4.getW(),
          if (active)
            SvgPicture.asset(
              AppImages.checkIconSvg,
              width: 13.we,
              height: 13.we,
              colorFilter: const ColorFilter.mode(
                AppColors.cF07448,
                BlendMode.srcIn,
              ),
            ),
        ],
      ),
    );
  }
}
