import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_event.dart';
import 'package:foydali_nuqtalar/blocs/font_style/font_style_state.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class FontStyleBloc extends Bloc<FontStyleEvent, FontStyleState> {
  FontStyleBloc()
      : super(
          FontStyleState(
            textStyle: AppTextStyle.seoulRobotoRegular.copyWith(
              color: AppColors.c010A27,
              fontSize: 16,
            ),
            backgroundColor: AppColors.white,
            textAlign: TextAlign.start,
          ),
        ) {
    on<FontStyleSetSizeEvent>(_setFontSize);
    on<FontStyleSetFontFamilyEvent>(_setFontFamily);
    on<FontStyleSetTextAlignEvent>(_setTextAlign);
    on<FontStyleSetBackgroundColorEvent>(_setBackgroundColor);
  }

  void _setBackgroundColor(FontStyleSetBackgroundColorEvent event, emit) async {
    emit(state.copyWith(backgroundColor: event.backgroundColor));
  }

  void _setFontSize(FontStyleSetSizeEvent event, emit) async {
    emit(
      state.copyWith(
        textStyle: state.textStyle.copyWith(
          fontSize: (event.fontSize),
        ),
      ),
    );
  }

  void _setTextAlign(FontStyleSetTextAlignEvent event, emit) async {
    emit(
      state.copyWith(
        textAlign: event.textAlign,
      ),
    );
  }

  void _setFontFamily(FontStyleSetFontFamilyEvent event, emit) async {
    emit(
      state.copyWith(
        textStyle: state.textStyle.copyWith(
          fontFamily: event.fontFamily,
        ),
      ),
    );
  }
}
