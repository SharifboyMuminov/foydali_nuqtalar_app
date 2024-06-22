import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.maxLength,
    this.digitsOnly = false,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool? isPasswordInput;
  final bool? obscureText;
  final bool digitsOnly;
  final VoidCallback? onTabEye;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      inputFormatters: digitsOnly
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      controller: textEditingController,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      style: AppTextStyle.seoulRobotoSemiBold.copyWith(
        fontSize: 16.sp,
        color: Theme.of(context).colorScheme.secondary,
      ),
      cursorColor: errorText != null
          ? Theme.of(context).colorScheme.onError
          : AppColors.cF07448,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.we, vertical: 18.he),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: AppColors.cF07448,
            width: 3.we,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.40),
            width: 1.we,
          ),
        ),
        labelText: hintText,
        labelStyle: AppTextStyle.seoulRobotoRegular.copyWith(
          color: errorText != null
              ? Theme.of(context).colorScheme.onError
              : Theme.of(context).colorScheme.secondary.withOpacity(0.60),
          fontSize: 16.sp,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onError,
            width: 2.we,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onError,
            width: 1.we,
          ),
        ),
        errorText: errorText,
        errorStyle: AppTextStyle.seoulRobotoRegular.copyWith(
          color: Theme.of(context).colorScheme.onError,
          fontSize: 12.sp,
        ),
        suffixIcon: isPasswordInput != null
            ? IconButton(
                onPressed: onTabEye,
                icon: SvgPicture.asset(
                  isPasswordInput!
                      ? AppImages.openEyeSvg
                      : AppImages.closeEyeSvg,
                  width: 24.we,
                  height: 24.we,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
