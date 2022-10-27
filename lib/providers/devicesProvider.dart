import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../modal/Device.dart';

class DevicesProvider extends ChangeNotifier {
  String URL = 'http://10.0.2.2:5000';
  List<Device> _devices = [];

  UnmodifiableListView<Device> get devices => UnmodifiableListView(_devices);

  void postDevice(String name, String serialNumber, String price,
      String stockQuantity) async {
    Device device = Device(
        id: new Random().nextInt(999),
        name: name,
        serialNumber: serialNumber,
        price: double.parse(price),
        stockQuantity: int.parse(stockQuantity));

    await Dio().post('$URL/devices',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: device.toJson());

    addDevice(device);
  }

  void addDevice(Device device) async {
    _devices.add(device);
    notifyListeners();
  }

  void remove(Device device) {
    _devices.remove(device);
    notifyListeners();
  }

  Future<void> getDevices() async {
    if (_devices.isNotEmpty) return;
    var response = await Dio().get('$URL/devices');
    _devices = List<Device>.from(response.data.map((value) => Device.fromJson(value)));
    notifyListeners();
  }
}
