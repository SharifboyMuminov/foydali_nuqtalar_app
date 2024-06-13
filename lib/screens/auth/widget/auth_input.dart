import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class AuthMyInput extends StatelessWidget {
  const AuthMyInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.textInputType,
    this.textInputAction,
    this.obscureText,
    this.onTabEye,
    this.isPasswordInput,
    this.errorText,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool? isPasswordInput;
  final bool? obscureText;
  final VoidCallback? onTabEye;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
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
        labelText: hintText,
        labelStyle: AppTextStyle.seoulRobotoRegular.copyWith(
          color: errorText != null
              ? Colors.red
              : AppColors.c010A27.withOpacity(0.60),
          fontSize: 16.sp,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.we,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.we,
          ),
        ),
        errorText: errorText,
        suffixIcon: isPasswordInput != null
            ? IconButton(
                onPressed: onTabEye,
                icon: SvgPicture.asset(
                  isPasswordInput!
                      ? AppImages.openEyeSvg
                      : AppImages.closeEyeSvg,
                  width: 24.we,
                  height: 24.we,
                ),
              )
            : null,
      ),

    );
  }
}
