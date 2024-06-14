import 'package:flutter/material.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/seting_background_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';

class SetBackgroundFont extends StatelessWidget {
  const SetBackgroundFont({
    super.key,
    required this.color,
    required this.onChangedColor,
  });

  final Color color;
  final ValueChanged<Color> onChangedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.we,
        vertical: 16.he,
      ),
      child: Row(
        children: [
          Expanded(
            child: SetBackgroundColorMyButton(
              onTab: () {
                onChangedColor.call(AppColors.white);
              },
              active: color == AppColors.white,
            ),
          ),
          8.getW(),
          Expanded(
            child: SetBackgroundColorMyButton(
              backgroundColor: AppColors.cF9F2E2,
              onTab: () {
                onChangedColor.call(AppColors.cF9F2E2);
              },
              active: AppColors.cF9F2E2 == color,
            ),
          ),
        ],
      ),
    );
  }
}
