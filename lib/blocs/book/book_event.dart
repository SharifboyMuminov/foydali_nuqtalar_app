import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {}

class BookFetchEvent extends BookEvent {
  @override
  List<Object?> get props => [];
}
