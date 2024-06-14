import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_bloc.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_event.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_bloc.dart';
import 'package:foydali_nuqtalar/blocs/book/book_bloc.dart';
import 'package:foydali_nuqtalar/blocs/book/book_event.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_bloc.dart';
import 'package:foydali_nuqtalar/data/api/api_provider.dart';
import 'package:foydali_nuqtalar/data/repositories/app_info_repository.dart';
import 'package:foydali_nuqtalar/data/repositories/auth_repository.dart';
import 'package:foydali_nuqtalar/data/repositories/book_repository.dart';
import 'package:foydali_nuqtalar/screens/splash/splash_screen.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final ApiProvider _apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository(_apiProvider)),
        RepositoryProvider(create: (_) => AppInfoRepository(_apiProvider)),
        RepositoryProvider(create: (_) => BookRepository(_apiProvider)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AppInfoBloc(
              context.read<AppInfoRepository>(),
            )..add(AppInfoGetEvent()),
          ),
          BlocProvider(
            create: (context) => BookBloc(
              context.read<BookRepository>(),
            )..add(BookFetchEvent()),
          ),
          BlocProvider(create: (_) => FontStyleBloc()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.white,
              ),
              home: child,
            );
          },
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
