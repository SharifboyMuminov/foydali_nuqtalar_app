import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class FontStyleEvent extends Equatable {}

class FontStyleSetSizeEvent extends FontStyleEvent {
  final double fontSize;

  FontStyleSetSizeEvent({required this.fontSize});

  @override
  List<Object?> get props => [fontSize];
}

class FontStyleSetFontFamilyEvent extends FontStyleEvent {
  final String fontFamily;

  FontStyleSetFontFamilyEvent({required this.fontFamily});

  @override
  List<Object?> get props => [fontFamily];
}

class FontStyleSetTextAlignEvent extends FontStyleEvent {
  final TextAlign textAlign;

  FontStyleSetTextAlignEvent({required this.textAlign});

  @override
  List<Object?> get props => [textAlign];
}

class FontStyleSetBackgroundColorEvent extends FontStyleEvent {
  final Color backgroundColor;

  FontStyleSetBackgroundColorEvent({required this.backgroundColor});

  @override
  List<Object?> get props => [backgroundColor];
}
