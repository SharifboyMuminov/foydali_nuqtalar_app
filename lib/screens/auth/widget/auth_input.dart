import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class AuthMyInput extends StatelessWidget {
  const AuthMyInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.textInputType, this.textInputAction,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction:textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      style: AppTextStyle.seoulRobotoSemiBold.copyWith(
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.we, vertical: 18.he),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: AppColors.c010A27.withOpacity(0.40),
            width: 2.we,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: AppColors.c010A27.withOpacity(0.40),
            width: 1.we,
          ),
        ),
        hintText: hintText,
        helperStyle: AppTextStyle.seoulRobotoRegular.copyWith(
          color: AppColors.c010A27.withOpacity(0.60),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
