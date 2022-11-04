import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDetailPageNoSql extends StatefulWidget {
  const TestDetailPageNoSql({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<TestDetailPageNoSql> createState() => _TestDetailPageNoSqlState();
}

class _TestDetailPageNoSqlState extends State<TestDetailPageNoSql> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text('${widget.name}'),
          backgroundColor: Colors.deepPurple[400],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
       body: Text('${widget.name}')
    );
  }
}
