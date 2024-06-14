import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/screens/books/books_screen.dart';
import 'package:foydali_nuqtalar/screens/choose_language/choose_language_screen.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    String userFullName = StorageRepository.getString(key: "user_full_name");

    Future.delayed(
      const Duration(milliseconds: 2300),
      () {
        if (userFullName.isEmpty) {
          bool oldUser = StorageRepository.getBool(key: "old_user");

          if (oldUser) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const BooksScreen();
              },
            ), (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const ChooseLanguageScreen();
              },
            ), (route) => false);
          }
        } else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const BooksScreen();
            },
          ), (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/splash_icon.svg",
              width: 159.we,
              height: 159.we,
            ),
            20.getH(),
            Text(
              "Foydali".toUpperCase(),
              style: AppTextStyle.seoulPollerOneBold.copyWith(
                color: AppColors.c010A27,
                fontSize: 32.sp,
              ),
            ),
            Text(
              "nuqtalar".toUpperCase(),
              style: AppTextStyle.seoulPollerOneBold.copyWith(
                color: AppColors.c010A27,
                fontSize: 32.sp,
              ),
            ),
            10.getH(),
            Text(
              "Shuxrat Xo‘ja",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.c000645.withOpacity(0.40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
