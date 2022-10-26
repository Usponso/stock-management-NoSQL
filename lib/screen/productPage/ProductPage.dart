import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_management/provider/devicesProvider.dart';

import '../../modal/Device.dart';
import '../customDialog/CustomDialog.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  Future<bool> getDevices(BuildContext context) async {
    await Provider.of<DevicesProvider>(context, listen: false).getDevices();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => createDevice(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: FutureBuilder(
        future: getDevices(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print("has data");
            return Consumer<DevicesProvider>(
              builder: (context, provider, child) {
                print(provider.devices.length);
                return ListView.builder(
                  itemCount: provider.devices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading:
                            Icon(Icons.devices, color: Colors.deepPurple[400]),
                        title: Text(
                            "${provider.devices[index].name} - ${provider.devices[index].price} €"),
                        subtitle: Text(
                            "Stock : ${provider.devices[index].stockQuantity}"),
                        trailing: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.network(provider.devices[index].picture,
                              fit: BoxFit.cover),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.grey.shade500, width: 0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void createDevice(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog();
      },
    );
  }
}
