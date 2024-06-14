import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/setting_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SetFontFamily extends StatelessWidget {
  const SetFontFamily({
    super.key,
    required this.textStyle,
    required this.onChanged,
  });

  final TextStyle textStyle;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
      child: Row(
        children: [
          Text(
            "Shrift",
            style: AppTextStyle.seoulRobotoMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.c010A27,
            ),
          ),
          const Spacer(),
          SettingButton(
            onTab: () {
              onChanged.call("Roboto");
            },
            active: (textStyle.fontFamily ?? "") == "Roboto",
            title: "Roboto",
          ),
          8.getW(),
          SettingButton(
            onTab: () {
              onChanged.call("PollerOne");
            },
            active: (textStyle.fontFamily ?? "") == "PollerOne",
            title: 'PollerOne',
          ),
        ],
      ),
    );
  }
}
