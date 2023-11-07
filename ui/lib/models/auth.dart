import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/auth/login.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/utils/api.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String fname,
    required String lname,
    required String mobileNumber,
    required String email,
    required String password,
    required int courseId
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'fname': fname,
        'lname': lname,
        'mobile_number': mobileNumber,
        'email': email,
        'password': password,
        'course_id': courseId
      };

      var response = await http.post(
        Uri.parse('${ApiEndpoints.baseUrl}/auth/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.off(() => const LoginPage());
      } else {
        isLoading.value = false;
        Get.showSnackbar(
          GetSnackBar(
            message: json.decode(response.body)['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade600,
          )
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${ApiEndpoints.baseUrl}/auth/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        await prefs.setString('token', token.value);
        Get.off(() => const HomePage());
      } else {
        isLoading.value = false;
        print(json.decode(response.body)['message']);
        Get.showSnackbar(
          GetSnackBar(
            message: json.decode(response.body)['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade600,
          )
        );
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }
}