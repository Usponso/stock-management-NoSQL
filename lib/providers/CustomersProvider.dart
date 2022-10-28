import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/constants.dart';
import '../modal/Customer.dart';
import '../service/customer-service.dart' as CustomerService;

class CustomerProvider extends ChangeNotifier {
String customerName = "";
String customerSiret = "";
String customerPhoneNumber = "";

  void setData(dataType, value) {
    switch(dataType) {
      case "customerName": {
        customerName = value;
      }
      break;

      case "customerSiret": {
        customerSiret = value;
      }
      break;

      case "customerPhoneNumber": {
        customerPhoneNumber = value;
      }
      break;
    }
  }

  void resetData() {
    customerName = "";
    customerSiret = "";
    customerPhoneNumber = "";
  }

  Future<void> addCustomer() async {
    try {
      await Dio().post('$API_URL/customers', data: {'company_name': customerName, 'siret': customerSiret, 'phone_number' : customerPhoneNumber});
    } catch(e) {
      print(e);
    }
  }
}

