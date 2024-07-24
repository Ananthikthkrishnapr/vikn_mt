import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikncodes_mt/controller/login_controller.dart';

class ProfileController with ChangeNotifier {
  UserData? _userData;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _profilePicture;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get profilePicture => _profilePicture;

  //  void setUserDetails(UserData userData) {
  //   _userData = userData;
  //   fetchProfile();

  // }
  


  Future<void> fetchProfile(String accessToken) async {
    // final prefs = await SharedPreferences.getInstance();
    // final accessToken = prefs.getString('accessToken');



    // if (accessToken == null) {
    //   print('No access token found.');
    //   return;
    // }

    final response = await http.get(
      Uri.parse('https://www.api.viknbooks.com/api/v10/users/user-view/62/'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'];

      _firstName = data['first_name'];
      _lastName = data['last_name'];
      _email = data['email'];
      // Assuming `profile_data` is the key for profile image
      _profilePicture = jsonData['customer_data']['photo'];

      notifyListeners();
    } else {
      print('Failed to load profile data. Status code: ${response.statusCode}');
    }
  }
}
