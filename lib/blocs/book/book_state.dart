import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar/data/models/book/book_model.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';

class BookState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final int activePage;
  final FromStatus fromStatus;
  final List<BookModel> bookModels;

  const BookState({
    required this.activePage,
    required this.errorText,
    required this.fromStatus,
    required this.statusMessage,
    required this.message,
    required this.bookModels,
  });

  BookState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    int? activePage,
    FromStatus? fromStatus,
    List<BookModel>? bookModels,
  }) {
    return BookState(
      errorText: errorText ?? this.errorText,
      fromStatus: fromStatus ?? this.fromStatus,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      bookModels: bookModels ?? this.bookModels,
      activePage: activePage ?? this.activePage,
    );
  }

  @override
  List<Object?> get props => [
        errorText,
        fromStatus,
        statusMessage,
        message,
        bookModels,
        activePage,
      ];
}
