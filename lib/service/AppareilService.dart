import 'package:dio/dio.dart';
import '../modal/Appareil.dart';

Future<void> getAppareils() async{
  var response = await Dio().get('http://127.0.0.1:3000/app');
  print(response.data);
}