import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import '../modal/Appareil.dart';
import '../modal/Device.dart';


DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

Future<List<Appareil>> getAppareils() async{
  try {
    var response = await Dio().get('http://10.0.2.2:3000/app');
    List<Appareil> appareils = [];
    response.data.forEach((element) => appareils.add(Appareil.fromJson(element)));
    return appareils;
  } catch(e) {
    print(e);
    return [];
  }

}

Future<Appareil?> getAppareil(id) async{
  try {
    var response = await Dio().get('http://10.0.2.2:3000/app/$id');
    Appareil appareil = response.data;

    return appareil;
  } catch(e) {
    print(e);
    return null;
  }
}

void postDevice(String name, String serialNumber, String price,
    String stockQuantity) async {
  Appareil appareil = Appareil(
      name: name,
      numCode: serialNumber,
      price: double.parse(price),
      quantity: double.parse(stockQuantity),
      image: '');

  /*await Dio().post('http://10.0.2.2:3000/app',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: appareil.toJson());*/

  await databaseReference.set({"test" : appareil.toJson()});
}

