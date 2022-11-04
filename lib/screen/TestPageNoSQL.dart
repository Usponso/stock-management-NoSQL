import 'package:flutter/material.dart';
import 'package:stock_management/screen/TestAddAppareilNoSql.dart';
import 'package:stock_management/screen/TestDetailPageNoSql.dart';
import 'package:stock_management/service/AppareilService.dart';

class TestPageNoSQL extends StatelessWidget {
  const TestPageNoSQL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'addPerson',
        child: const Icon(Icons.add),
        onPressed: () => createDevice(context),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: FutureBuilder(
        future: getAppareils(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestDetailPageNoSql(name: snapshot.data![index].name! )))
                        },
                    title: Text((snapshot.data![index].name!)));
              },
            );
            return Text("OKAY");
          } else if (snapshot.hasError) {
            return Text("ERROR");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void createDevice(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TestAddAppareilNoSql();
      },
    );
  }
}
