import 'package:flutter/material.dart';
import 'package:stock_management/service/AppareilService.dart';

class TestPageNoSQL extends StatelessWidget {
  const TestPageNoSQL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAppareils(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Text("OKAY");
          } else if(snapshot.hasError){
            return Text("ERROR");
          } else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
