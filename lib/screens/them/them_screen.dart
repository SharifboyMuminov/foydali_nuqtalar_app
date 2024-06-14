import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/them/widget/theme_list_tile.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool theme = false;
  bool auto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Dastur rejimi",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            fontSize: 20.sp,
            color: AppColors.c010A27,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
      ),
      body: Column(
        children: [
          ThemeMyListTileButton(
            onTab: () {
              theme = !theme;
              setState(() {});
            },
            onChanged: (bool value) {
              theme = value;
              setState(() {});
            },
            value: theme,
            title: 'Tungi rejim',
            leadingIconPath: AppImages.themDarkSvg,
          ),
          ThemeMyListTileButton(
            onTab: () {
              auto = !auto;
              setState(() {});
            },
            onChanged: (bool value) {
              auto = value;
              setState(() {});
            },
            value: auto,
            title: 'Avto (qurilmadagidek)',
            leadingIconPath: AppImages.systemSvg,
          ),
        ],
      ),
    );
  }
}
