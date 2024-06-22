import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/blocs/book/book_bloc.dart';
import 'package:foydali_nuqtalar/blocs/book/book_event.dart';
import 'package:foydali_nuqtalar/blocs/book/book_state.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_bloc.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_event.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_state.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/screens/auth/sign_up/sing_up_screen.dart';
import 'package:foydali_nuqtalar/screens/buy/buy_screen.dart';
import 'package:foydali_nuqtalar/screens/caution/caution_screen.dart';
import 'package:foydali_nuqtalar/screens/chapters/chapters_screen.dart';
import 'package:foydali_nuqtalar/screens/choose_language/choose_language_screen.dart';
import 'package:foydali_nuqtalar/screens/info/info_screen.dart';
import 'package:foydali_nuqtalar/screens/settings/dialog/show_logout_dialog.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/app_bar_button.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/line_grey.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/my_drawer.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/set_background_font.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/set_font_family.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/set_text_align.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/setting_bottom_item.dart';
import 'package:foydali_nuqtalar/screens/settings/widget/slider_text_size.dart';
import 'package:foydali_nuqtalar/screens/them/them_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late final String fullName;
  late final String email;

  bool showSetting = false;

  @override
  void initState() {
    fullName = StorageRepository.getString(key: "user_full_name");
    email = StorageRepository.getString(key: "email");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("user_full_name: $fullName");
    // debugPrint("email: $email");
    return BlocBuilder<FontStyleBloc, FontStyleState>(
      builder: (BuildContext context, FontStyleState state) {
        return Scaffold(
          drawerEnableOpenDragGesture: false,
          key: _key,
          drawer: MyDrawer(
            fullName: fullName,
            email: email,
            onTabRegister: _onTabRegister,
            onTabProfile: () {},
            onTabTheme: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ThemeScreen();
                  },
                ),
              );
            },
            onTabLanguage: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ChooseLanguageScreen(
                      isSetLanguage: true,
                    );
                  },
                ),
              );
            },
            onTabInfo: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InfoScreen();
                  },
                ),
              );
            },
            onTabVideo: () {},
            onTabLogout: () {
              showLogoutDialog(
                context,
                onTanExit: () {
                  Navigator.pop(context);
                },
                onTabOk: () {
                  StorageRepository.setString(key: "user_full_name", value: '');
                  StorageRepository.setString(key: "email", value: '');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ), (route) => false);
                },
              );
            },
          ),
          appBar: _myAppBar(),
          body: BlocConsumer<BookBloc, BookState>(
            builder: (BuildContext context, BookState bookState) {
              if (bookState.fromStatus == FromStatus.error) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bookState.errorText,
                      style: AppTextStyle.seoulRobotoRegular.copyWith(
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    GlobalMyButton(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40.we, vertical: 40.he),
                      onTab: () {
                        context.read<BookBloc>().add(BookFetchEvent());
                      },
                      title: "Qayta urinib ko'rish",
                    ),
                  ],
                );
              }

              if (bookState.fromStatus == FromStatus.success) {
                if (bookState.bookModels.isEmpty) {
                  return Center(
                    child: Image.asset(AppImages.emptyPng),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.we,
                          vertical: 20.we,
                        ),
                        child: Column(
                          children: [
                            Text(
                              textAlign: state.textAlign,
                              bookState
                                  .bookModels[bookState.activePage].context,
                              style: state.textStyle.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!showSetting)
                      SettingBottomItem(
                        onTabToChapters: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChaptersScreen(
                                  siOldUser: fullName.isNotEmpty,
                                );
                              },
                            ),
                          );
                        },
                        onTabNextPage: () {
                          int activePage = bookState.activePage;

                          if (activePage < bookState.bookModels.length - 1) {
                            if (activePage < bookState.bookModels.length - 1 &&
                                bookState.bookModels[activePage + 1].isFree) {
                              context.read<BookBloc>().add(
                                    BookSetActivePageEvent(
                                      activePage: (++activePage),
                                    ),
                                  );
                            } else {
                              if (fullName.isEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const CautionScreen();
                                    },
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const BuyScreen();
                                    },
                                  ),
                                );
                              }
                            }
                          }
                        },
                        title: bookState.bookModels[bookState.activePage].title,
                        subTitle:
                            '${bookState.bookModels[bookState.activePage].order}-bob / ${bookState.bookModels.length}',
                      ),
                    if (showSetting)
                      Column(
                        children: [
                          const LenGrey(),
                          SetBackgroundFont(
                            color: state.backgroundColor,
                            onChangedColor: (Color value) {
                              context.read<FontStyleBloc>().add(
                                    FontStyleSetBackgroundColorEvent(
                                      backgroundColor: value,
                                    ),
                                  );
                            },
                          ),
                          const LenGrey(),
                          CostumeSliderTextSize(
                            textStyle: state.textStyle,
                            onChanged: (double value) {
                              context.read<FontStyleBloc>().add(
                                    FontStyleSetSizeEvent(
                                      fontSize: value,
                                    ),
                                  );
                            },
                          ),
                          const LenGrey(),
                          SetFontFamily(
                            textStyle: state.textStyle,
                            onChanged: (String value) {
                              context.read<FontStyleBloc>().add(
                                    FontStyleSetFontFamilyEvent(
                                      fontFamily: value,
                                    ),
                                  );
                            },
                          ),
                          const LenGrey(),
                          SetTextAlign(
                            textAlign: state.textAlign,
                            onChangedTextAlign: (TextAlign value) {
                              context.read<FontStyleBloc>().add(
                                    FontStyleSetTextAlignEvent(
                                      textAlign: value,
                                    ),
                                  );
                            },
                          ),
                          10.getH(),
                        ],
                      ),
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator.adaptive());
            },
            listener: (BuildContext context, BookState state) {},
          ),
        );
      },
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          _key.currentState!.openDrawer();
        },
        icon: SvgPicture.asset(
          AppImages.drawerSvg,
          width: 24.we,
          height: 24.we,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.secondary,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: fullName.isNotEmpty
          ? null
          : AppBarMyButton(
              onTab: _onTabRegister,
            ),
      actions: [
        IconButton(
          onPressed: () {
            showSetting = !showSetting;
            setState(() {});
          },
          icon: SvgPicture.asset(
            AppImages.settingSvg,
            width: 24.we,
            height: 24.we,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
        6.getW(),
      ],
    );
  }

  _onTabRegister() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const SignUpScreen();
      },
    ), (route) => false);
  }
}
