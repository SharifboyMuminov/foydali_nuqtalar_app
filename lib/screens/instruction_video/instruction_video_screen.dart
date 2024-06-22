import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/screens/auth/sign_up/sing_up_screen.dart';
import 'package:foydali_nuqtalar/screens/settings/setting_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class InstructionVideoScreen extends StatefulWidget {
  const InstructionVideoScreen({super.key});

  @override
  State<InstructionVideoScreen> createState() => _InstructionVideoScreenState();
}

class _InstructionVideoScreenState extends State<InstructionVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.cF07448.withOpacity(0.08),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppImages.circlesSvg,
              fit: BoxFit.fill,
              width: width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Image.asset(
                "assets/images/img.png",
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 60.he),
                child: Text(
                  "Video qo’llanma",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlobalMyButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.we,
                      vertical: 4.he,
                    ),
                    onTab: () {
                      StorageRepository.setBool(key: "old_user", value: true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                    title: "Profilga kirish",
                    titleColor: AppColors.c010A27,
                    backgroundColor: AppColors.white,
                  ),
                  GlobalMyButton(
                    onTab: () {
                      StorageRepository.setBool(key: "old_user", value: true);

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const SettingScreen();
                        },
                      ), (route) => false);
                    },
                    title: "Kitobni o’qish",
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.we,
                      vertical: 4.he,
                    ),
                  ),
                  20.getH(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
