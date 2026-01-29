import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:libconnect/core/const/api_endpoints.dart';
import 'package:libconnect/core/storage/user_pref.dart';
import 'package:libconnect/features/auth/models/login_user_model.dart';

import '../../start_screen.dart';

class SigninController extends GetxController {

  RxBool isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async{
    isLoading.value = true;

    try{
      final response = await http.post(
          Uri.parse(ApiEndpoints.signin),
          body: {
            "username" : usernameController.text,
            "password" : passwordController.text,
          }
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final LoginUserModel loginUser = LoginUserModel.fromJson(data);

        UserPref.setLoggedIn(loginUser.user?.isActive ?? false);
        UserPref.setName(loginUser.user?.firstName ?? '');
        UserPref.setAccessToken(loginUser.access ?? '');

        print('Sign in successful. User: ${loginUser.user?.firstName}');


        GoRouter.of(Get.context!).go('/start');


      } else {
        print('Sign in failed with status: ${response.statusCode}');
      }
      isLoading.value = false;
    }catch(e){
      print('Error during sign in: $e');
      isLoading.value = false;
    }


  }

}