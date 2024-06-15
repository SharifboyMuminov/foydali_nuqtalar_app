import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {}

class BookFetchEvent extends BookEvent {
  @override
  List<Object?> get props => [];
}

class BookSetActivePageEvent extends BookEvent {
  final int activePage;

  BookSetActivePageEvent({required this.activePage});

  @override
  List<Object?> get props => [activePage];
}
