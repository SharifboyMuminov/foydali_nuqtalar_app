import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

showLogoutDialog(
  BuildContext context, {
  required VoidCallback onTanExit,
  required VoidCallback onTabOk,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.we, vertical: height / 2.8),
        child: Material(
          borderRadius: BorderRadius.circular(4.r),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.we,
              vertical: 20.he,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Tizimdan chiqmoqchimisiz?",
                  style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20.sp,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GlobalMyButton(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.10),
                        titleColor: Theme.of(context).colorScheme.secondary,
                        margin: EdgeInsets.zero,
                        onTab: onTanExit,
                        title: "Bekor qilish",
                      ),
                    ),
                    8.getW(),
                    Expanded(
                      child: GlobalMyButton(
                        margin: EdgeInsets.zero,
                        onTab: onTabOk,
                        title: "Tizimdan chiqish",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
