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

class LoginController extends ChangeNotifier {
  late String username;
  late String password;
  late bool isMobile;
  late bool _isLoading = false;
  late String _errorMessage;
  late Map<String, dynamic> _loginResponse;
  String _accessToken = '';
  String get accessToken => _accessToken;
  bool _obscureText = true;

  bool get obscureText => _obscureText;

 void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

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
        _accessToken = responseData['data']['access'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', _accessToken);
        notifyListeners();

        print("TOKEN : $accessToken");
        print("USERID : $userId");

        Future<void> loadAccessToken() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          _accessToken = prefs.getString('accessToken') ?? '';
          notifyListeners();
        }
        print(loadAccessToken);

        final salesController =
            Provider.of<SalesController>(context, listen: false);
        salesController
            .setUserData(UserData(accessToken: accessToken, userId: userId));

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
