import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/blocs/book/book_bloc.dart';
import 'package:foydali_nuqtalar/blocs/book/book_event.dart';
import 'package:foydali_nuqtalar/blocs/book/book_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/screens/books/widget/book_button.dart';
import 'package:foydali_nuqtalar/screens/settings/setting_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Dastur haqida",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            fontSize: 20.sp,
            color: AppColors.c010A27,
          ),
        ),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (BuildContext context, BookState state) {
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
                GlobalMyButton(
                  margin:
                      EdgeInsets.symmetric(horizontal: 40.we, vertical: 40.he),
                  onTab: () {
                    context.read<BookBloc>().add(BookFetchEvent());
                  },
                  title: "Qayta urinib ko'rish",
                ),
              ],
            );
          }

          if (state.fromStatus == FromStatus.success) {
            return ListView.builder(
              itemCount: state.bookModels.length,
              itemBuilder: (BuildContext context, int index) {
                return BookMyButton(
                  onTab: () {
                    if (state.bookModels[index].isFree) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SettingScreen();
                          },
                        ),
                      );
                    } else {
                      //TODO No Profile or Money :)
                    }
                  },
                  isFirst: index == 0,
                  order: state.bookModels[index].order,
                  title: state.bookModels[index].title,
                  isFree: state.bookModels[index].isFree,
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
