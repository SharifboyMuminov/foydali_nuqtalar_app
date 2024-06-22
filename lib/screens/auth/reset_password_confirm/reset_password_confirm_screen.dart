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

class ResetPasswordConfirmScreen extends StatefulWidget {
  const ResetPasswordConfirmScreen({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordConfirmScreen> createState() =>
      _ResetPasswordConfirmScreenState();
}

class _ResetPasswordConfirmScreenState
    extends State<ResetPasswordConfirmScreen> {
  final TextEditingController controllerNewPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerActiveCode = TextEditingController();
  String? errorTextNewPassword;
  String? errorTextConfirmPassword;
  String? errorTextActiveCode;

  @override
  void initState() {
    _listenControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return PopScope(
          canPop: state.fromStatus != FromStatus.loading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Yangi parol",
              ),
              leading: IconButton(
                onPressed: () {
                  if (state.fromStatus != FromStatus.loading) {
                    Navigator.pop(context);
                  }
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
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.we),
                    child: Column(
                      children: [
                        4.getH(),
                        Text(
                          "Elektron pochtangizni kelgan kodni va yangi parolni kiriting",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.c010A27.withOpacity(0.40),
                            fontSize: 16.sp,
                          ),
                        ),
                        20.getH(),
                        AuthMyInput(
                          errorText: errorTextNewPassword,
                          textEditingController: controllerNewPassword,
                          hintText: "Yangi parol",
                        ),
                        12.getH(),
                        AuthMyInput(
                          errorText: errorTextConfirmPassword,
                          textEditingController: controllerConfirmPassword,
                          hintText: "Yangi parolni qaytadan kiriting",
                        ),
                        12.getH(),
                        AuthMyInput(
                          errorText: errorTextActiveCode,
                          maxLength: 6,
                          textInputType: TextInputType.number,
                          digitsOnly: true,
                          textInputAction: TextInputAction.done,
                          textEditingController: controllerActiveCode,
                          hintText: "The code you received",
                        ),
                      ],
                    ),
                  ),
                ),
                GlobalMyButton(
                  loading: state.fromStatus == FromStatus.loading,
                  backgroundColor: _checkInput
                      ? null
                      : Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                  onTab: state.fromStatus == FromStatus.loading
                      ? null
                      : _checkInput
                          ? () {
                              context.read<AuthBloc>().add(
                                    AuthResetPasswordConfirmEvent(
                                      email: widget.email,
                                      confirmPassword:
                                          controllerConfirmPassword.text,
                                      newPassword: controllerNewPassword.text,
                                      activationCode: controllerActiveCode.text,
                                    ),
                                  );
                            }
                          : null,
                  title: "Davom etish",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool get _checkInput {
    return AppRegExp.passwordRegExp.hasMatch(controllerNewPassword.text) &&
        AppRegExp.passwordRegExp.hasMatch(controllerConfirmPassword.text) &&
        controllerActiveCode.text.length == 6;
  }

  _listenControllers() {
    controllerNewPassword.addListener(() {
      if (controllerNewPassword.text.isEmpty) {
        setState(() {
          errorTextNewPassword = 'Password is required';
        });
      } else if (!AppRegExp.passwordRegExp
          .hasMatch(controllerNewPassword.text)) {
        setState(() {
          errorTextNewPassword = 'Enter a valid password';
        });
      } else {
        setState(() {
          errorTextNewPassword = null;
        });
      }
    });
    controllerConfirmPassword.addListener(() {
      if (controllerConfirmPassword.text.isEmpty) {
        setState(() {
          errorTextConfirmPassword = 'Password is required';
        });
      } else if (!AppRegExp.passwordRegExp
          .hasMatch(controllerConfirmPassword.text)) {
        setState(() {
          errorTextConfirmPassword = 'Enter a valid password';
        });
      } else if (controllerConfirmPassword.text != controllerNewPassword.text) {
        setState(() {
          errorTextConfirmPassword = "Not equal to the new password :)";
        });
      } else {
        setState(() {
          errorTextConfirmPassword = null;
        });
      }
    });
    controllerActiveCode.addListener(() {
      if (controllerActiveCode.text.isEmpty) {
        setState(() {
          errorTextActiveCode = 'Active code is required';
        });
      } else if (controllerActiveCode.text.length < 6) {
        setState(() {
          errorTextActiveCode = 'maxLength > 5 :)';
        });
      } else {
        setState(() {
          errorTextActiveCode = null;
        });
      }
    });
  }

  @override
  void dispose() {
    controllerNewPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerActiveCode.dispose();
    super.dispose();
  }
}
