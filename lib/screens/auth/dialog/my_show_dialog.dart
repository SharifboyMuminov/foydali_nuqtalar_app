import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

myShowDialog(
  BuildContext context, {
  required VoidCallback onTab,
  required String title,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: Text(
          title,
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            color: AppColors.c010A27,
            fontSize: 15.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onTab,
            child: Text(
              "Ok",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                color: Colors.blue,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      );
    },
  );
}
