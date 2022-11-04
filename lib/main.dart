import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_management/screen/TestPageNoSQL.dart';
import 'package:stock_management/screen/customerPage/CustomersPage.dart';
import 'package:stock_management/providers/CustomersProvider.dart';
import 'package:stock_management/providers/SearchCustomersProvider.dart';
import 'package:stock_management/providers/devicesProvider.dart';
import 'package:stock_management/screen/productPage/ProductPage.dart';
import 'package:stock_management/screen/widgets/DetailedBill.dart';

import 'firebase_options.dart';

void main() async {
  /*runApp(const MyApp());*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CustomerProvider(),),
      ChangeNotifierProvider(create: (context) => DevicesProvider(),),
      /*ChangeNotifierProvider(create: (context) => SearchCustomerProvider(),),*/
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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Gestion de stock'),
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
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ProductPage(),
    CustomersPage(),
    TestPageNoSQL(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: "Produits",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Répertoire",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: "Test NoSQL",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
