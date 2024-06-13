import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/home/widget/my_drawer.dart';
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
      drawer: MyDrawer(
        onTabRegister: () {},
        onTabProfile: () {},
        onTabTheme: () {},
        onTabLanguage: () {},
        onTabInfo: () {},
        onTabVideo: () {},
        onTabLogout: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                backgroundColor: AppColors.white,
                title: Text(
                  "Tizimdan chiqmoqchimisiz?",
                  style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                    color: AppColors.c010A27,
                    fontSize: 20.sp,
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                        child: GlobalMyButton(
                          backgroundColor: AppColors.c010A27.withOpacity(0.08),
                          titleColor: AppColors.c010A27,
                          margin: EdgeInsets.zero,
                          onTab: () {},
                          title: "Bekor qilish",
                        ),
                      ),
                      8.getW(),
                      Expanded(
                        child: GlobalMyButton(
                          margin: EdgeInsets.zero,
                          onTab: () {},
                          title: "Tizimdan chiqish",
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
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
