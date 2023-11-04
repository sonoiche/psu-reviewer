import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/pages/settings.dart';
import 'package:ui/utils/api.dart';

class UserController extends GetxController {
  dynamic fnameController = TextEditingController();
  dynamic mnameController = TextEditingController();
  dynamic lnameController = TextEditingController();
  dynamic emailController = TextEditingController();
  dynamic passwordController = TextEditingController();
  dynamic password2Controller = TextEditingController();
  dynamic mobileController = TextEditingController();

  Future<void> updateUser(id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    final SharedPreferences prefs = await _prefs;
    try {
      var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer ${prefs.getString('token')}'};
      var url = Uri.parse('${ApiEndpoints.baseUrl}/users/$id');
  
      Map body = {
        'fname': fnameController.text,
        'mname': mnameController.text,
        'lname': lnameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'password_confirmation': password2Controller.text,
        'mobile_number': mobileController.text,
        '_method': 'PUT'
      };
    print(body);
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if(json['success']) {
        Get.off(() => const Settings());
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}