import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/setting_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SetTextAlign extends StatelessWidget {
  const SetTextAlign({
    super.key,
    required this.textAlign,
    required this.onChangedTextAlign,
  });

  final TextAlign textAlign;
  final ValueChanged<TextAlign> onChangedTextAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.we,
        vertical: 16.he,
      ),
      child: Row(
        children: [
          Text(
            "Matn tekkislanishi",
            style: AppTextStyle.seoulRobotoMedium.copyWith(
              fontSize: 16.sp,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const Spacer(),
          SettingButton(
            padding: EdgeInsets.symmetric(
              horizontal: 28.we,
              vertical: 13.he,
            ),
            onTab: () {
              onChangedTextAlign.call(TextAlign.center);
            },
            active: textAlign == TextAlign.center,
            iconPath: AppImages.drawerSvg,
          ),
          8.getW(),
          SettingButton(
            padding: EdgeInsets.symmetric(
              horizontal: 28.we,
              vertical: 13.he,
            ),
            onTab: () {
              onChangedTextAlign.call(TextAlign.start);
            },
            active: textAlign == TextAlign.start,
            iconPath: AppImages.alignSvg,
          ),
        ],
      ),
    );
  }
}
