import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController controllerPasswordOne = TextEditingController();
  final TextEditingController controllerPasswordTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Yangi parol",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Column(
                children: [
                  4.getH(),
                  Text(
                    "Elektron pochtangizni kiriting va biz unga parolni tiklash uchun kod yuboramiz",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: AppColors.c010A27.withOpacity(0.40),
                      fontSize: 16.sp,
                    ),
                  ),
                  20.getH(),
                  AuthMyInput(
                    textEditingController: controllerPasswordOne,
                    hintText: "Yangi parol",
                  ),
                  12.getH(),
                  AuthMyInput(
                    textEditingController: controllerPasswordTwo,
                    hintText: "Yangi parolni qaytadan kiriting",
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            onTab: () {},
            title: "Davom etish",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controllerPasswordOne.dispose();
    controllerPasswordTwo.dispose();
    super.dispose();
  }
}
