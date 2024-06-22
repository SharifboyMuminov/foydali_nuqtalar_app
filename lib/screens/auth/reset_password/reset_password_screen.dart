import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_bloc.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_event.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_reg_exp.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  String? errorTextForEmail;

  @override
  void initState() {
    _listenControllerEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Parolni tiklash",

        ),
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
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return Column(
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
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.40),
                          fontSize: 16.sp,
                        ),

                      ),
                      20.getH(),
                      AuthMyInput(
                        textInputAction: TextInputAction.done,
                        textEditingController: controllerEmail,
                        hintText: "Elektron pochta",
                        errorText: errorTextForEmail,
                      ),
                    ],
                  ),
                ),
              ),
              GlobalMyButton(
                loading: state.fromStatus == FromStatus.loading,
                backgroundColor: _checkEmail ? null : Colors.grey,
                onTab: state.fromStatus == FromStatus.loading
                    ? null
                    : _checkEmail
                        ? () {
                            context.read<AuthBloc>().add(
                                  AuthResetPasswordEvent(
                                    email: controllerEmail.text,
                                  ),
                                );
                          }
                        : null,
                title: "Davom etish",
              ),
            ],
          );
        },
      ),
    );
  }

  bool get _checkEmail {
    return AppRegExp.emailRegExp.hasMatch(controllerEmail.text);
  }

  _listenControllerEmail() {
    controllerEmail.addListener(() {
      if (controllerEmail.text.isEmpty) {
        setState(() {
          errorTextForEmail = 'Email is required';
        });
      } else if (!_checkEmail) {
        setState(() {
          errorTextForEmail = 'Enter a valid email address';
        });
      } else {
        setState(() {
          errorTextForEmail = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }
}
