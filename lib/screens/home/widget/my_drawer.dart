import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/home/widget/drawer_button.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.onTabRegister,
    required this.onTabProfile,
    required this.onTabTheme,
    required this.onTabLanguage,
    required this.onTabInfo,
    required this.onTabVideo,
    required this.onTabLogout,
    this.fullName = "",
    this.email = "",
  });

  final VoidCallback onTabRegister;
  final VoidCallback onTabProfile;
  final VoidCallback onTabTheme;
  final VoidCallback onTabLanguage;
  final VoidCallback onTabInfo;
  final VoidCallback onTabVideo;
  final VoidCallback onTabLogout;
  final String fullName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      width: width - (73.we),
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
          if (fullName.isEmpty)
            GlobalMyButton(
              margin: EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
              iconPath: AppImages.profileSvg,
              padding: EdgeInsets.symmetric(vertical: 12.he),
              onTab: onTabRegister,
              title: "Profilga kirish",
              titleColor: AppColors.white,
            ),
          if (fullName.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.we,
                    vertical: 14.he,
                  ),
                  backgroundColor: AppColors.cF07448.withOpacity(0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                onPressed: onTabProfile,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.profileTwoSvg,
                      width: 32.we,
                      height: 32.we,
                    ),
                    8.getW(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            fullName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.seoulRobotoRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.c010A27,
                            ),
                          ),
                          Text(
                            email,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.seoulRobotoRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.c010A27.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          DrawerMyListTileButton(
            onTab: onTabTheme,
            title: 'Dastur rejimi',
            iconPath: AppImages.themDarkSvg,
          ),
          DrawerMyListTileButton(
            onTab: onTabLanguage,
            title: 'Dastur tili',
            iconPath: AppImages.uzbFlagSvg,
            trailingTitle: "O‘zbekcha",
          ),
          DrawerMyListTileButton(
            onTab: onTabInfo,
            title: 'Dastur haqida',
            iconPath: AppImages.infoSvg,
          ),
          DrawerMyListTileButton(
            onTab: onTabVideo,
            title: 'Video qo\'llanma',
            iconPath: AppImages.videoSvg,
          ),
          DrawerMyListTileButton(
            titleColor: AppColors.cB3261E,
            onTab: onTabLogout,
            title: 'Tizimdan chiqish',
            iconPath: AppImages.logoutSvg,
          ),
        ],
      ),
    );
  }
}
