import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ThemeMyListTileButton extends StatelessWidget {
  const ThemeMyListTileButton({
    super.key,
    required this.onTab,
    required this.onChanged,
    required this.value,
    required this.title,
    required this.leadingIconPath,
  });

  final VoidCallback onTab;
  final ValueChanged<bool> onChanged;
  final bool value;
  final String title;
  final String leadingIconPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          width: 1.we,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.we,
        vertical: 12.he,
      ),
      onTap: onTab,
      leading: SvgPicture.asset(
        leadingIconPath,
        width: 24.we,
        height: 24.we,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.secondary,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.seoulRobotoMedium.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 16.sp,
        ),
      ),
      trailing: CupertinoSwitch(
        trackColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
