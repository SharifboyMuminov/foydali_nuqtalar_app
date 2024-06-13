import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _key,
      drawer: Drawer(
        width: width / 1.2,
        child: Column(
          children: [
            45.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FOYDALI",
                    style: AppTextStyle.seoulPollerOneSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.c010A27,
                    ),
                  ),
                  SvgPicture.asset(
                    AppImages.splashIconSvg,
                    width: 48.we,
                    height: 48.we,
                  ),
                  Text(
                    "NUQTALAR",
                    style: AppTextStyle.seoulPollerOneSemiBold.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.c010A27,
                    ),
                  ),
                ],
              ),
            ),
            GlobalMyButton(
              margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
              iconPath: AppImages.profileSvg,
              onTab: () {},
              title: "Profilga kirish",
              titleColor: AppColors.white,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: SvgPicture.asset(
            AppImages.drawerSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
      ),
    );
  }
}
