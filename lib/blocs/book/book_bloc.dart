import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar/blocs/book/book_event.dart';
import 'package:foydali_nuqtalar/blocs/book/book_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';
import 'package:foydali_nuqtalar/data/repositories/book_repository.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(this._bookRepository)
      : super(
          const BookState(
            errorText: "",
            fromStatus: FromStatus.pure,
            statusMessage: "",
            message: "",
            bookModels: [],
          ),
        ) {
    on<BookFetchEvent>(_fetchBooks);
  }

  final BookRepository _bookRepository;

  Future<void> _fetchBooks(BookFetchEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _bookRepository.fetchBooks();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          bookModels: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
