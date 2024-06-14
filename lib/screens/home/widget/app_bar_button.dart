import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class AppBarMyButton extends StatelessWidget {
  const AppBarMyButton({super.key, required this.onTab});
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        backgroundColor: AppColors.cF07448.withOpacity(0.08),
      ),
      onPressed: onTab,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppImages.profileTwoSvg,
            colorFilter: const ColorFilter.mode(
              AppColors.cF07448,
              BlendMode.srcIn,
            ),
            width: 24.we,
            height: 24.we,
          ),
          4.getW(),
          Text(
            "Profilga kirish",
            style: AppTextStyle.seoulRobotoRegular.copyWith(
              fontSize: 14.sp,
              color: AppColors.cF07448,
            ),
          ),
        ],
      ),
    );
  }
}
