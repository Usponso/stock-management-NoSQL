import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_management/CustomersPage.dart';
import 'package:stock_management/providers/CustomersProvider.dart';
import 'package:stock_management/provider/devicesProvider.dart';
import 'package:stock_management/screen/productPage/ProductPage.dart';

void main() {
  /*runApp(const MyApp());*/
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CustomerProvider(),),
      ChangeNotifierProvider(create: (context) => DevicesProvider(),)
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
  static const List<Widget> _widgetOptions = <Widget>[
    ProductPage(),
    CustomersPage(),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
