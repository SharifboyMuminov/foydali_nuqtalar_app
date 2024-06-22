import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
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
  late bool isTheme;
  late bool autoTheme;

  @override
  void initState() {
    isTheme = StorageRepository.getBool(key: "theme");
    autoTheme = StorageRepository.getBool(key: "auto");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dastur rejimi",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ThemeMyListTileButton(
            onTab: () {
              if (!autoTheme) {
                isTheme = !isTheme;
                setState(() {});
                StorageRepository.setBool(key: "theme", value: isTheme);
              }
            },
            onChanged: (bool value) {
              if (!autoTheme) {
                StorageRepository.setBool(key: "theme", value: value);

                isTheme = value;
                setState(() {});
              }
            },
            value: isTheme,
            title: 'Tungi rejim',
            leadingIconPath: AppImages.themDarkSvg,
          ),
          ThemeMyListTileButton(
            onTab: () {
              autoTheme = !autoTheme;
              StorageRepository.setBool(key: "auto", value: autoTheme);
              if (autoTheme) {
                isTheme = false;
                StorageRepository.setBool(key: "theme", value: false);
              }
              setState(() {});
            },
            onChanged: (bool value) {
              autoTheme = value;
              StorageRepository.setBool(key: "auto", value: autoTheme);
              if (autoTheme) {
                isTheme = false;
                StorageRepository.setBool(key: "theme", value: false);
              }
              setState(() {});
            },
            value: autoTheme,
            title: 'Avto (qurilmadagidek)',
            leadingIconPath: AppImages.systemSvg,
          ),
        ],
      ),
    );
  }
}
