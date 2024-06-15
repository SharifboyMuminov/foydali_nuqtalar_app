import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class BookMyButton extends StatelessWidget {
  const BookMyButton({
    super.key,
    required this.onTab,
    required this.isFirst,
    required this.title,
    required this.order,
    required this.isFree,
  });

  final VoidCallback onTab;
  final bool isFirst;
  final String title;
  final int order;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        top: BorderSide(
          width: 1.we,
          color: isFirst
              ? AppColors.c010A27.withOpacity(
                  0.12,
                )
              : Colors.transparent,
        ),
        bottom: BorderSide(
          width: (0.5 / 393) * width,
          color: AppColors.c010A27.withOpacity(
            0.12,
          ),
        ),
      ),
      onTap: onTab,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.we,
        vertical: 16.he,
      ),
      leading: Container(
        padding: EdgeInsets.symmetric(
          horizontal: order < 10 ? 10.we : 5.we,
          vertical: order < 10 ? 10.we : 5.we,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !isFree
              ? AppColors.c010A27.withOpacity(0.04)
              : AppColors.cF07448.withOpacity(0.08),
        ),
        child: Text(
          order.toString(),
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            fontSize: 16.sp,
            color: !isFree
                ? AppColors.c010A27.withOpacity(0.4)
                : AppColors.cF07448,
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.we),
        child: Text(
          title,
          style: AppTextStyle.seoulRobotoMedium.copyWith(
            fontSize: 16.sp,
            color: !isFree
                ? AppColors.c010A27.withOpacity(0.4)
                : AppColors.cF07448,
          ),
        ),
      ),
    );
  }
}
