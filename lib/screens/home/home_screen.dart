import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/home/dialog/show_logout_dialog.dart';
import 'package:foydali_nuqtalar/screens/home/widget/my_drawer.dart';
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
        onTabTheme: () {},
        onTabLanguage: () {},
        onTabInfo: () {},
        onTabVideo: () {},
        onTabLogout: () {
          showLogoutDialog(
            context,
            onTanExit: () {},
            onTabOk: () {},
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
