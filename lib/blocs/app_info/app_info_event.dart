import 'package:equatable/equatable.dart';

abstract class AppInfoEvent extends Equatable {}

class AppInfoGetEvent extends AppInfoEvent {
  @override
  List<Object?> get props => [];
}
