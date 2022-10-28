import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../modal/Customer.dart';
import '../service/customer-service.dart' as CustomerService;

class CustomerProvider extends ChangeNotifier {
String customerName = "";
String customerSiret = "";
String customerPhoneNumber = "";
String URL = "http://10.0.2.2:5000";

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
    Customer customer = Customer(companyName: customerName, siret: customerSiret, phoneNumber: customerPhoneNumber);
    try {
      await Dio().post('$URL/customers', data: customer);
      _customers.add(customer);
      notifyListeners();
    } catch(e) {
      print(e);
    }

  }

List<Customer> _customers = [];

UnmodifiableListView<Customer> get customers => UnmodifiableListView(_customers);

Future<List<Customer>> getCustomers() async {
  try {
    var response = await Dio().get('$URL/customers');
    /*List<Customer> customersList =[];*/
    /*List<Customer> customersList = response.data.map((customer) => Customer.fromJson(customer)).toList() as List<Customer>;*/
    response.data.forEach((customer) => _customers.add(Customer.fromJson(customer)));
    notifyListeners();
    return _customers;
  } catch (e) {
    print(e);
    return [];
  }
}
}

