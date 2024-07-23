import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vikncodes_mt/controller/login_controller.dart';
import 'package:vikncodes_mt/model_sale.dart';

class SalesController with ChangeNotifier {
  UserData? _userData;
  List<Sales> _salesData = [];
  int _currentPage = 1;
  bool _isLoading = false;

  List<Sales> get salesData => _salesData;
  bool get isLoading => _isLoading;

  SalesController() {
    // Removed initializeSharedPrefs() call (handled in LoginController)
  }

  void setUserData(UserData userData) {
    // Update access token and user ID from provided UserData
    _userData = userData;
    print('Access Token (from Login): ${userData.accessToken}'); 
    print('User ID (from Login): ${userData.userId}'); 

    loadSalesData(); // Trigger initial data load
  }

  Future<void> loadSalesData() async {
    if (_userData == null) {
      print('No user data available. Please login first.');
      return;
    }

    final String accessToken = _userData!.accessToken;
    final String userId = _userData!.userId.toString();

    _isLoading = true;
    _currentPage = 1; // Reset current page on new load
    notifyListeners();

    final Map<String, dynamic> requestData = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": userId,
      "PriceRounding": 3,
      "page_no": _currentPage,
      "items_per_page": 10,
      "type": "Sales",
      "WarehouseID": 1
    };

    final response = await http.post(
      Uri.parse('https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode(requestData),
    );

    _isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final salesData = jsonData['data'];
      if (salesData != null) {
        _salesData = salesData.map<Sales>((sale) => Sales.fromJson(sale)).toList();
      } else {
        _salesData = []; // Handle null data case (optional)
      }
    } else {
      _salesData = [];
    }
  }

  void loadMoreData() async {
    if (!_isLoading) {
      _currentPage++; // Increment page number for next load
      await loadSalesData(); // Load data for the new page
    }
  }
}