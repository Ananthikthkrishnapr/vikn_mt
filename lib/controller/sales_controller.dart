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
  bool _hasMoreData = true;

  List<Sales> get salesData => _salesData;
  bool get isLoading => _isLoading;

  SalesController() {
    dataLoading();
  }

  void setUserData(UserData userData) {
    _userData = userData;
    _currentPage = 1;
    _salesData = [];
    _hasMoreData = true;
    dataLoading();
  }

  Future<void> dataLoading() async {
    if (_userData == null) {
      print('No user data available. Please login first.');
      return;
    }

    if (!_hasMoreData) {
      return;
    }

    final String accessToken = _userData!.accessToken;
    final String userId = _userData!.userId.toString();

    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> requestData = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": userId,
      "PriceRounding": 3,
      "page_no": _currentPage,
      "items_per_page": 20,
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
      if (salesData != null && salesData.isNotEmpty) {
        _salesData.addAll(salesData.map<Sales>((sale) => Sales.fromJson(sale)).toList());
      } else {
        _hasMoreData = false;
      }
    } else {
      _hasMoreData = false;
    }
  }

  void pagination() async {
    if (!_isLoading && _hasMoreData) {
      _currentPage++;
      await dataLoading();
    }
  }
}
