import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_management/CustomersPage.dart';
import 'package:stock_management/providers/CustomersProvider.dart';

class AddCustomerForm extends StatefulWidget {
  const AddCustomerForm({Key? key}) : super(key: key);

  @override
  State<AddCustomerForm> createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[50],
      content: Stack(
        children: [
          Form(
            /*key: _formKey,*/
            child: Consumer<CustomerProvider>(
              builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Icon(Icons.person_outline_outlined),
                      margin: EdgeInsets.only(bottom: 15),
                    ),
                    Text(
                      "Ajouter un client",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Card(
                      color: Colors.deepPurple[50],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          bottom: 5, left: 10, right: 10, top: 30),
                      child: ListTile(
                        title: TextField(
                          onChanged: (value) {
                            Provider.of<CustomerProvider>(context,
                                    listen: false)
                                .setData("customerName", value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Nom du fournisseur',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.deepPurple[50],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: TextField(
                          onChanged: (value) {
                            Provider.of<CustomerProvider>(context, listen: false).setData("customerSiret", value);
                          },
                          decoration: InputDecoration(
                            hintText: 'SIRET',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.deepPurple[50],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      margin: EdgeInsets.only(
                          bottom: 20, left: 10, right: 10, top: 5),
                      child: ListTile(
                        title: TextField(
                          onChanged: (value) {
                            Provider.of<CustomerProvider>(context, listen: false).setData("customerPhoneNumber", value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Numéro de téléphone',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                child: Text("Annuler"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple[100],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Provider.of<CustomerProvider>(context, listen: false).resetData();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                child: Text("Ajouter"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple[400],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Provider.of<CustomerProvider>(context, listen:false).addCustomer();
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomersPage()));
                                },
                              ),
                            )
                          ],
                        ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
