import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikncodes_mt/controller/sales_controller.dart';


class UserData {
  final String accessToken;
  final int userId;

  UserData({required this.accessToken, required this.userId});
}

// Define the login controller
class LoginController extends ChangeNotifier {
 late  String _username;
 late String _password;
 late bool _isMobile;
 late bool _isLoading = false;
 late String _errorMessage;
 late Map<String, dynamic> _loginResponse;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Map<String, dynamic> get loginResponse => _loginResponse;

  Future<bool> loginUser(
      String username, String password, BuildContext context) async {
    final url =
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');
    final body = json.encode(
        {"username": username, "password": password, "is_mobile": true});

    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      final responseData = json.decode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        final userData = responseData['data'];
        final accessToken = userData['access'];
        final userId = userData['user_id'];

        print("TOKEN : $accessToken");
        print("USERID : $userId");

        // Save access token and user ID to shared preferences
        // await _prefs.setString('accessToken', accessToken);
        // await _prefs.setInt('userId', userId);

        // Provide UserData to SalesController (new):
        final salesController =
            Provider.of<SalesController>(context, listen: false);
        salesController
            .setUserData(UserData(accessToken: accessToken, userId: userId));

        return true;
   } else {
        // Handle login error
        return false;
      }
    } catch (e) {
      // Handle network or server errors
      return false;
    }
  }

  // Future<void> logoutUser() async {
  //   // Remove access token and user ID from shared preferences
  //   await _prefs.remove('accessToken');
  //   await _prefs.remove('userId');

  //   // Notify listeners about logout
  //   notifyListeners();// }
}