import 'package:foydali_nuqtalar/data/api/api_provider.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';

class BookRepository {
  final ApiProvider _apiProvider;

  BookRepository(this._apiProvider);

  Future<NetworkResponse> fetchBooks() => _apiProvider.fetchBooks();
}
