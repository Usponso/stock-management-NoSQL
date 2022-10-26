import 'package:dio/dio.dart';

import '../modal/Customer.dart';

const String URL = "http://10.0.2.2:5000";


Future<List<Customer>> getCustomers() async {
  try {
    var response = await Dio().get('$URL/customers');
    List<Customer> customersList =[];
    /*List<Customer> customersList = response.data.map((customer) => Customer.fromJson(customer)).toList() as List<Customer>;*/
    response.data.forEach((customer) => customersList.add(Customer.fromJson(customer)));
    print(customersList);


    return customersList;
  } catch (e) {
      print(e);
      return [];
  }
}