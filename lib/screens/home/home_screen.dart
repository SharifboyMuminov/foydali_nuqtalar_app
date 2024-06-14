import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_bloc.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_event.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_state.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/screens/auth/sign_up/sing_up_screen.dart';
import 'package:foydali_nuqtalar/screens/choose_language/choose_language_screen.dart';
import 'package:foydali_nuqtalar/screens/home/dialog/show_logout_dialog.dart';
import 'package:foydali_nuqtalar/screens/home/widget/app_bar_button.dart';
import 'package:foydali_nuqtalar/screens/home/widget/line_grey.dart';
import 'package:foydali_nuqtalar/screens/home/widget/my_drawer.dart';
import 'package:foydali_nuqtalar/screens/home/widget/set_background_font.dart';
import 'package:foydali_nuqtalar/screens/home/widget/set_font_family.dart';
import 'package:foydali_nuqtalar/screens/home/widget/set_text_align.dart';
import 'package:foydali_nuqtalar/screens/home/widget/slider_text_size.dart';
import 'package:foydali_nuqtalar/screens/info/info_screen.dart';
import 'package:foydali_nuqtalar/screens/them/them_screen.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late final String fullName;
  late final String email;

  @override
  void initState() {
    fullName = StorageRepository.getString(key: "user_full_name");
    email = StorageRepository.getString(key: "email");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _key,
      drawer: MyDrawer(
        fullName: fullName,
        email: email,
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
        centerTitle: true,
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
        title: fullName.isNotEmpty
            ? null
            : AppBarMyButton(
                onTab: () {},
              ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.settingSvg,
              width: 24.we,
              height: 24.we,
            ),
          ),
          6.getW(),
        ],
      ),
      body: BlocBuilder<FontStyleBloc, FontStyleState>(
        builder: (BuildContext context, FontStyleState state) {
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
                        """Qadimiy rivoyatlarga ko‘ra, Xitoyda bir dehqon muntazam bosh og‘rig‘idan qiynalib yurgan. Bir kun dalada yer chopayotganda, adashib oyog‘iga ketmon bilan zarba berib yuboradi. To‘satdan bosh og‘riq taqa-taq to‘xtaydi. Bir qancha vaqt o‘tib, mamlakat bo‘ylab boshi og‘rigan insonlar oyoqlarini ketmon urishga tushib ketishadi. Bundan xabar topgan imperator saroy tabiblariga oddiyroq va qulayroq usul topishni buyuradi. Xullas, izlanishlar va turli bemorlarda tajriba va kuzatuvlar natijasida ma’lum bir nuqtalarni igna, kuydirish va uqalash orqali bemorlarni davolashni boshlashadi. Keyinchalik, bu usullar Malayziya, Indoneziya, Filippin, Yaponiya, Vetnam, Tayland va Koreyaga tarqaldi. Men o‘zim 25 yildan ko‘p harbiy qo‘l jangi usullaridan instruktor bo‘lib ishlaganman. Jangovar sportlarda inson badanining har qanday joyiga zarba berilsa, bir xilda ta’sir ko‘rsatmasligi ma'lum holat. Masalan, bor kuch bilan yuz qismiga musht ursangiz, zarba yegan inson ko‘p hollarda bunga chidashi mumkin. Lekin shu zarba kuchidan bir necha barobar kuchsiz zarbani ma'lum bir nuqtaga ursangiz, inson hushidan ketib yiqilishi, hattoki, o‘lishi ham mumkin. Shunday nuqtalar bor-ki, ularga zarba tushganda inson umumiy yoki qisman falaj (paralich) holatiga tushadi. Qo‘l va oyoqlar qisman yoki butunlay shol bo‘lib qoladi.""",
                        style: state.textStyle,
                      ),
                    ],
                  ),
                ),
              ),
              const LenGrey(),
              SetBackgroundFont(
                color: state.backgroundColor,
                onChangedColor: (Color value) {},
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
                onChanged: (String value) {},
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
          );
        },
      ),
    );
  }
}
