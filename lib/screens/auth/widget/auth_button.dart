import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class AuthMyButton extends StatelessWidget {
  const AuthMyButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.iconPathSvg,
  });

  final VoidCallback onTab;
  final String title;
  final String iconPathSvg;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        side:
            BorderSide(color: AppColors.c010A27.withOpacity(0.40), width: 1.we),
        padding: EdgeInsets.symmetric(
          vertical: 17.he,
        ),
      ),
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPathSvg,
            width: 24.we,
            height: 24.we,
          ),
          8.getW(),
          Text(
            title,
            style: AppTextStyle.seoulRobotoSemiBold.copyWith(
              color: AppColors.c010A27,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
