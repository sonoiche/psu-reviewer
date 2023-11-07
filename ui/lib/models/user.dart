import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ui/utils/api.dart';

Future<User> fetchUser() async {
  final box = GetStorage();
  var token = box.read('token');
  
  var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/user'), headers: headers);
  
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load User');
  }
}

class User {
  final int? id;
  final String? fname;
  final String? mname;
  final String? lname;
  final String? email;
  final String? mobileNumber;
  final String? fullname;
  final int? courseId;

  const User({
    required this.id,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.email,
    required this.mobileNumber,
    required this.fullname,
    required this.courseId
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fname: json['fname'],
      mname: json['mname'] ?? '',
      lname: json['lname'],
      email: json['email'],
      mobileNumber: json['mobile_number'],
      fullname: json['fullname'],
      courseId: json['course_id'] ?? 0
    );
  }
}

class Course {
  final int? id;
  final String? name;
  Course(this.id, this.name);
}

class UserService {
  Future<User> getUser() async {
    final box = GetStorage();
    var token = box.read('token');

    var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/user'), headers: headers);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['data']);
    } else {
      throw Exception('Failed to fetch data.');
    }
  }

  Future updateUser({
    required int userId,
    required String fname,
    required String? mname,
    required String lname,
    required String email,
    required String mobileNumber,
    required String password,
    required String password2
  }) async {
    final box = GetStorage();
    var token = box.read('token');

    try {
      var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var url = Uri.parse('${ApiEndpoints.baseUrl}/users/$userId');
  
      Map body = {
        'id': userId,
        'fname': fname,
        'mname': mname,
        'lname': lname,
        'email': email,
        'password': password,
        'password_confirmation': password2,
        'mobile_number': mobileNumber,
        '_method': 'PUT'
      };
      
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if(json['statusCode'] == 200) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Personal Information has been updated.',
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.green.shade600,
          )
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade600,
          )
        );
        throw jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updatePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String confirmPassword
  }) async {
    final box = GetStorage();
    var token = box.read('token');

    try {
      var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var url = Uri.parse('${ApiEndpoints.baseUrl}/users/$userId?what=password');
  
      Map body = {
        'current_password': currentPassword,
        'password': newPassword,
        'password_confirmation': confirmPassword,
        '_method': 'PUT'
      };
      
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if(json['statusCode'] == 200) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Password has been updated.',
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.green.shade600,
          )
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade600,
          )
        );
        throw jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Course>>  getCourseOptions() async {
    final box = GetStorage();
    var token = box.read('token');

    var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/courses'), headers: headers);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final List<Course> courses = [];
      for (var i = 0; i < data['data'].length; i++) {
        final entry = data['data'][i];
        courses.add(Course(entry['id'], entry['name']));
      }
      return courses;
    } else {
      throw Exception('Failed to fetch data.');
    }
  }
}