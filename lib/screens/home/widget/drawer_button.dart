import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class DrawerMyListTileButton extends StatelessWidget {
  const DrawerMyListTileButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.iconPath,
    this.trailingTitle,
    this.titleColor,
  });

  final VoidCallback onTab;
  final String title;
  final String? trailingTitle;
  final String iconPath;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        trailingTitle ?? "",
        style: AppTextStyle.seoulRobotoRegular.copyWith(
          fontSize: 16.sp,
          color: AppColors.c010A27.withOpacity(0.4),
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          width: 1.we,
          color: AppColors.c010A27.withOpacity(0.08),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.we,
        vertical: 12.he,
      ),
      onTap: () {},
      leading: SvgPicture.asset(
        iconPath,
        width: 24.we,
        height: 24.we,
      ),
      title: Text(
        title,
        style: AppTextStyle.seoulRobotoMedium.copyWith(
          color: titleColor ?? AppColors.c010A27,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
