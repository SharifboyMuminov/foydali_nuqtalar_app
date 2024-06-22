import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_bloc.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_event.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/screens/auth/verification/widget/password_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _listenPinController();
    super.initState();
  }

  _listenPinController() {
    _pinController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Kodni kiriting",
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
                        "Elektron pochtangizni tasdiqlash uchun biz unga kod yubordik",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.seoulRobotoRegular.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.40),
                          fontSize: 16.sp,
                        ),
                      ),
                      20.getH(),
                      PasswordMyInput(
                        pinController: _pinController,
                        focusNode: _focusNode,
                      ),
                    ],
                  ),
                ),
              ),
              GlobalMyButton(
                backgroundColor: _pinController.text.length == 6
                    ? null
                    : Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                loading: state.fromStatus == FromStatus.loading,
                onTab: _pinController.text.length == 6
                    ? () {
                        debugPrint("Email: ${widget.email}");
                        debugPrint("PinCode: ${_pinController.text}");
                        context.read<AuthBloc>().add(
                              AuthVerifyEvent(
                                email: widget.email,
                                activateCode: _pinController.text,
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

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
