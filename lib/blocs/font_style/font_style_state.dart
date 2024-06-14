import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class FontStyleState extends Equatable {
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color backgroundColor;

  const FontStyleState({
    required this.textStyle,
    required this.backgroundColor,
    required this.textAlign,
  });

  FontStyleState copyWith({
    TextStyle? textStyle,
    Color? backgroundColor,
    TextAlign? textAlign,
  }) {
    return FontStyleState(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textAlign: textAlign ?? this.textAlign,
    );
  }

  @override
  List<Object?> get props => [
        textStyle,
        backgroundColor,
        textAlign,
      ];
}
