import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SettingBottomItem extends StatelessWidget {
  const SettingBottomItem({
    super.key,
    required this.onTabToChapters,
    required this.onTabNextPage,
    required this.title,
    required this.subTitle,
  });

  final VoidCallback onTabToChapters;
  final VoidCallback onTabNextPage;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        top:
            BorderSide(color: AppColors.c010A27.withOpacity(0.08), width: 1.we),
      ),
      contentPadding: EdgeInsets.only(
        right: 20.we,
        top: 15.he,
        bottom: 15.he,
        left: 20.we,
      ),
      leading: IconButton(
        onPressed: onTabToChapters,
        icon: SvgPicture.asset(
          AppImages.settingBottomIconSvg,
          width: 24.we,
          height: 24.we,
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: AppTextStyle.seoulRobotoRegular.copyWith(
          fontSize: 16.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: IconButton(
        onPressed: onTabNextPage,
        icon: SvgPicture.asset(
          AppImages.arrowRightSvg,
          width: 24.we,
          height: 24.we,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.secondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
