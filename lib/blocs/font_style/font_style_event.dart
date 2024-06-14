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
