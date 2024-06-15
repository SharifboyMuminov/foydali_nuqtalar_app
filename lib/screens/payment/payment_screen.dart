import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/payment/widget/show_book.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "To‘lov usulini tanlang",
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
        shape: Border(
          bottom: BorderSide(
            color: AppColors.c010A27.withOpacity(0.08),
            width: 1.we,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 16.he,
                right: 20.we,
                left: 20.we,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShowBook(),
                  20.getH(),
                  Text(
                    "Pul o‘tkazmasi orqali",
                    style: AppTextStyle.seoulRobotoBold.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.c010A27,
                    ),
                  ),
                  10.getH(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.we, vertical: 16.he),
                    decoration: BoxDecoration(
                      color: AppColors.c010A27.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "8600 1234 5678 9101",
                              style: AppTextStyle.seoulRobotoRegular.copyWith(
                                fontSize: 16.sp,
                                color: AppColors.c010A27,
                              ),
                            ),
                            Text(
                              "Shuxrat Xo‘ja",
                              style: AppTextStyle.seoulRobotoRegular.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.c010A27.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppImages.copySvg,
                            width: 24.we,
                            height: 24.we,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.getH(),
                  Align(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Skrinshot jo‘natish",
                        style: AppTextStyle.seoulRobotoRegular.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.cF07448,
                        ),
                      ),
                    ),
                  ),
                  14.getH(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.he,
                          color: AppColors.c010A27.withOpacity(0.08),
                        ),
                      ),
                      20.getW(),
                      Text(
                        "Yoki",
                        style: AppTextStyle.seoulRobotoRegular.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.c010A27.withOpacity(0.4),
                        ),
                      ),
                      20.getW(),
                      Expanded(
                        child: Container(
                          height: 1.he,
                          color: AppColors.c010A27.withOpacity(0.08),
                        ),
                      ),
                    ],
                  ),
                  20.getH(),
                  Text(
                    "Karta ma’lumotlarini kiritish orqali",
                    style: AppTextStyle.seoulRobotoBold.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.c010A27,
                    ),
                  ),
                  10.getH(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.we,
                        vertical: 16.he,
                      ),
                      backgroundColor: AppColors.c010A27.withOpacity(0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.uzCardSvg,
                          width: 24.we,
                          height: 24.we,
                        ),
                        8.getW(),
                        SvgPicture.asset(
                          AppImages.humoSvg,
                          width: 24.we,
                          height: 24.we,
                        ),
                        8.getW(),
                        SvgPicture.asset(
                          AppImages.visaSvg,
                          width: 24.we,
                          height: 24.we,
                        ),
                        8.getW(),
                        SvgPicture.asset(
                          AppImages.masterCardSvg,
                          width: 24.we,
                          height: 24.we,
                        ),
                        12.getW(),
                        Text(
                          "To’lov qilish",
                          style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.c010A27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            margin: EdgeInsets.only(
              left: 20.we,
              right: 20.we,
              bottom: 16.he,
            ),
            onTab: () {},
            title: "Xaridni tekshirish",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.we),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yordam kerakmi?",
                  style: AppTextStyle.seoulRobotoRegular.copyWith(
                    color: AppColors.c010A27,
                    fontSize: 16.sp,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 4.we),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Adminga murojaat qilish",
                      style: AppTextStyle.seoulRobotoRegular.copyWith(
                        color: AppColors.cF07448,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          25.getH(),
        ],
      ),
    );
  }
}
