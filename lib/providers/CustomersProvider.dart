import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/constants.dart';
import '../modal/Customer.dart';

DatabaseReference databaseReference = FirebaseDatabase.instance.ref();


class CustomerProvider extends ChangeNotifier {
  String customerName = "";
  String customerSiret = "";
  String customerPhoneNumber = "";

  void setData(dataType, value) {
    switch (dataType) {
      case "customerName":
        {
          customerName = value;
        }
        break;

      case "customerSiret":
        {
          customerSiret = value;
        }
        break;

      case "customerPhoneNumber":
        {
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
    Customer customer = Customer(
        companyName: customerName,
        siret: customerSiret,
        phoneNumber: customerPhoneNumber);

    final newPostKey =
        FirebaseDatabase.instance.ref().child('customers').push().key;

    final Map<String, Map> updates = {};
    updates['/customers/$newPostKey'] = customer.toJson();

    return FirebaseDatabase.instance.ref().update(updates);
    try {
      print(databaseReference.path);
      /*await Dio().post('$API_URL/customers', data: customer);
      _customers.add(customer);
      notifyListeners();*/
      await databaseReference.set({"bite" : customer.toJson()});

    } catch (e) {
      print(e);
    }
  }







  List<Customer> _customers = [];
  String searchExpression = "";

  UnmodifiableListView<Customer> get customers =>
      UnmodifiableListView(_customers);

  Future<List<Customer>> getCustomers() async {
    _customers = [];
    try {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('customers').get();
      var encode = jsonEncode(snapshot.value);
      /*json.decode(encode).forEach((k,v) => print('${k}: ${v}'));*/

      if (_customers.length == 0)
        json.decode(encode).forEach((k,v) => {
          _customers.add(Customer.fromJson(v))
        });


      return _customers;

    } catch (e) {
      print(e);
      return [];
    }



    /*var response = await Dio().get('$API_URL/customers');
    if (_customers.length == 0)
      response.data
          .forEach((customer) => _customers.add(Customer.fromJson(customer)));
    notifyListeners();

    return _customers;*/

    /*try {
      var response = await Dio().get('$API_URL/customers');
      *//*List<Customer> customersList =[];*//*
      *//*List<Customer> customersList = response.data.map((customer) => Customer.fromJson(customer)).toList() as List<Customer>;*//*
      if (_customers.length == 0)
        response.data
            .forEach((customer) => _customers.add(Customer.fromJson(customer)));
      notifyListeners();
      print(_customers.length);

      return _customers;
    } catch (e) {
      print(e);
      return [];
    }*/
  }


  void changeSearchExpression(String newExpression){
    searchExpression = newExpression;
    notifyListeners();
  }

  List<Customer> getListFoundedCustomers(){
    List<Customer> foundedCustomers = [];
    _customers.forEach((customer) {
      if(customer.companyName.trim().toLowerCase().contains(searchExpression.trim().toLowerCase())) {
        foundedCustomers.add(customer);
      }
    });
    return foundedCustomers;
  }


}

