import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:libconnect/core/const/api_endpoints.dart';
import 'package:libconnect/core/storage/user_pref.dart';
import 'package:libconnect/features/auth/models/login_user_model.dart';
import 'package:libconnect/features/home/models/user_library_model.dart';

import '../../start_screen.dart';

class UserLibraryController extends GetxController {

  RxBool isLoading = false.obs;
  RxList<UserLibraryModel> userLibrary = <UserLibraryModel>[].obs;

  @override
  void onInit() {
    getUserLibrary();
    super.onInit();
  }

  Future<void> getUserLibrary() async{
    print('Fetching user library...');
    isLoading.value = true;
    String token = UserPref.accessToken() ?? '';
    try{
      final response = await http.get(
          Uri.parse(ApiEndpoints.myLibrary),
        headers: {

            'Authorization': 'Bearer $token'
        }
      );

      print('Response status: ${response.statusCode}');

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print('User library data: $data');

// data এখন List<Map<String,dynamic>> হবে
        userLibrary.value = (data as List)
            .map((e) => UserLibraryModel.fromJson(e))
            .toList();

      } else {
        print('Failed to fetch user library with status: ${response.statusCode} and body: ${response.body}');
      }

      isLoading.value = false;
    }catch(e){
      print('Error during sign in: $e');
      isLoading.value = false;
    }


  }

}