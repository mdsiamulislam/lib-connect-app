import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libconnect/core/const/api_endpoints.dart';
import 'package:libconnect/core/storage/user_pref.dart';
import 'package:libconnect/features/library/models/book_model.dart';

class UserLibraryBookController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<BookModel> libraryBook = <BookModel>[].obs;
  RxString errorMessage = ''.obs; // Optional: error handle

  @override
  void onInit() {
    getLibraryBooks();
    super.onInit();
  }

  Future<void> getLibraryBooks({int libraryId = 1}) async {
    print('Fetching books for library $libraryId...');
    isLoading.value = true;
    errorMessage.value = '';

    String token = UserPref.accessToken() ?? '';

    try {
      final response = await http.get(
        Uri.parse("${ApiEndpoints.discoverBooks}/$libraryId/"),
        // Optional: uncomment if backend needs token
        // headers: {
        //   'Authorization': 'Bearer $token'
        // },
      );

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Response body: $data');

        // Check if response is List or wrapped in 'books'
        List<dynamic> booksJson;
        if (data is List) {
          booksJson = data;
        } else if (data is Map && data['books'] != null) {
          booksJson = data['books'];
        } else {
          booksJson = [];
        }

        // Map JSON to BookModel
        libraryBook.value =
            booksJson.map((json) => BookModel.fromJson(json)).toList();

        print('Fetched ${libraryBook.length} books for library $libraryId.');
      } else {
        errorMessage.value =
        'Failed to fetch books: ${response.statusCode}';
        print(
            'Failed to fetch user library with status: ${response.statusCode} and body: ${response.body}');
        libraryBook.value = [];
      }
    } catch (e) {
      errorMessage.value = 'Error fetching books: $e';
      print('Error during fetching books: $e');
      libraryBook.value = [];
    } finally {
      isLoading.value = false;
    }
  }
}
