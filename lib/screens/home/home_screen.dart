import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/auth/sign_up/sing_up_screen.dart';
import 'package:foydali_nuqtalar/screens/choose_language/choose_language_screen.dart';
import 'package:foydali_nuqtalar/screens/home/dialog/show_logout_dialog.dart';
import 'package:foydali_nuqtalar/screens/home/widget/my_drawer.dart';
import 'package:foydali_nuqtalar/screens/info/info_screen.dart';
import 'package:foydali_nuqtalar/screens/them/them_screen.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';

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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ), (route) => false);
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

class FontSizeSlider extends StatefulWidget {
  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  double _currentFontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shrift hajmi',
              style: TextStyle(fontSize: _currentFontSize),
            ),
            Slider.adaptive(
              // secondaryTrackValue: 18,
              mouseCursor: MouseCursor.defer,
              autofocus: true,
              thumbColor: AppColors.cF07448,
              activeColor: AppColors.cF07448,
              inactiveColor: AppColors.c010A27.withOpacity(0.08),
              value: _currentFontSize,
              min: 16.sp,
              max: 32.sp,
              divisions: 30,
              label: _currentFontSize.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentFontSize = value;
                });
              },
            ),
            Text(
              _currentFontSize.round().toString(),
              style: TextStyle(fontSize: _currentFontSize),
            ),
          ],
        ),
      ),
    );
  }
}
