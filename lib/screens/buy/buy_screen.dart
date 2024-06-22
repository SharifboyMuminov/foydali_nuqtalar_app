import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/payment/payment_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
            width: 1.we,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.he, horizontal: 20.we),
              child: Column(
                children: [
                  Text(
                    "To’liq kitobni o‘qish uchun xarid qilishingiz kerak",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.sp,
                    ),
                  ),
                  6.getH(),
                  Text(
                    "Hozirda siz kitobning dastlabki 3 bobini bepul o'qishingiz mumkin.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  14.getH(),
                  Image.asset(
                    AppImages.bookPng,
                    width: 214.we,
                    height: 272.he,
                  ),
                  Text(
                    "Kitob narxi",
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                    ),
                  ),
                  Text(
                    "100 000 so‘m",
                    style: AppTextStyle.seoulRobotoBold.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.cF07448,
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
              bottom: 30.he,
            ),
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentScreen();
                  },
                ),
              );
            },
            title: "Kitobni xarid qilish",
          ),
        ],
      ),
    );
  }
}
