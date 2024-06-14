import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Dastur haqida",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
        child: Column(
          children: [
            Text(
              """"Foydali Nuqtalar" mobil ilovasi inson salomatligini yaxshilash uchun akupunktura va akupressura usullarini o'rganishni osonlashtiradi. Ushbu ilova orqali siz tanadagi muayyan nuqtalar haqida ma'lumot olishingiz, ularni qanday topish va ularga qanday ta'sir ko'rsatish kerakligini o'rganishingiz mumkin. Ilova foydalanuvchilarga sog'lig'ini yaxshilash va turli kasalliklarni davolash uchun tabiiy va samarali usullarni taqdim etadi. Dasturda oson tushunarli ko'rsatmalar va vizual yordamchilar mavjud bo'lib, har qanday foydalanuvchi bu usullarni osongina qo'llashi mumkin.""",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                fontSize: 18.sp,
                color: AppColors.c010A27,
              ),
            ),
            25.getH(),
            Text(
              "Bizning maqsadimiz — har bir insonni sog'lom va baxtli hayot kechirishiga yordam berishdir.",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                fontSize: 18.sp,
                color: AppColors.c010A27,
              ),
            ),
            25.getH(),
            Text(
              "Ushbu kitob mualliflik huquqi qonuni bilan himoyalangan. Kitobdan nusxa ko‘chirish, muallifning nomi eslatilmasdan taqriz keltirish, muallifning ruhsatisiz chop etish va har qanday usulda tarqatish qonun bilan taqiqlanadi.",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                fontSize: 18.sp,
                color: AppColors.c010A27,
              ),
            ),
            17.getH(),
            SvgPicture.asset(
              AppImages.versionSvg,
              width: 61.we,
              height: 18.he,
            ),
          ],
        ),
      ),
    );
  }
}
