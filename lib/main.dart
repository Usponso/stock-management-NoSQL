import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_management/CustomersPage.dart';
import 'package:stock_management/providers/CustomersProvider.dart';

void main() {
  /*runApp(const MyApp());*/
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CustomerProvider(),),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: Container(
          child: CustomersPage(),
        ));
  }
}
