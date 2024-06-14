import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_bloc.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
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
      body: BlocBuilder<AppInfoBloc, AppInfoState>(
        builder: (BuildContext context, AppInfoState state) {
          if (state.fromStatus == FromStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.errorText,
                  style: AppTextStyle.seoulRobotoRegular.copyWith(
                    fontSize: 20.sp,
                    color: AppColors.c010A27,
                  ),
                ),
                GlobalMyButton(onTab: () {}, title: "Qayta urinib ko'rish"),
              ],
            );
          }

          if (state.fromStatus == FromStatus.success) {
            String text = state.appInfoModel.content.replaceAll("</p>", "");
            text = text.replaceAll("<p>", "");
            text = text.replaceAll("<br>", " ");
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20.we,
                right: 20.we,
                top: 20.he,
                bottom: 20.he,
              ),
              child: Column(
                children: [
                  25.getH(),
                  Text(
                    text,
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.c010A27,
                    ),
                  ),
                  25.getH(),
                  SvgPicture.asset(
                    AppImages.versionSvg,
                    width: 61.we,
                    height: 18.he,
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
