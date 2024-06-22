import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class LanguageMyButton extends StatelessWidget {
  const LanguageMyButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.iconPath,
    required this.active,
  });

  final VoidCallback onTab;
  final String title;
  final String iconPath;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: active ? AppColors.cF07448.withOpacity(0.10) : null,
        border: active
            ? null
            : Border(
                bottom: BorderSide(
                  width: 1.we,
                  color: AppColors.c010A27.withOpacity(
                    0.08,
                  ),
                ),
              ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.he, horizontal: 20.we),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: onTab,
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.we,
              height: 24.we,
            ),
            20.getW(),
            Expanded(
              child: AnimatedDefaultTextStyle(
                style: active
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        )
                    : Theme.of(context).textTheme.headlineLarge!,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (active)
              SvgPicture.asset(
                AppImages.checkIconSvg,
                width: 16.we,
                height: 14.we,
              ),
          ],
        ),
      ),
    );
  }
}
