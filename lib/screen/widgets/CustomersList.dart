import 'package:flutter/material.dart';
import 'package:stock_management/screen/customerPage/CustomerDetailsPage.dart';
import '../../modal/Customer.dart';
import '../../service/customer-service.dart' as CustomerService;

class CustomersList extends StatefulWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  State<CustomersList> createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  final Future<List<Customer>> customersList = CustomerService.getCustomers();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 530,
        child: FutureBuilder<List<Customer>>(
            future: customersList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Customer>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Customer customer = snapshot.data![index];
                    return Card(
                        color: Colors.grey[100],
                        elevation: 0,
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerDetailsPage(
                                        id: customer.id,
                                        companyName: customer.companyName,
                                        phoneNumber: customer.phoneNumber,
                                        siret: customer.siret,
                                      ))),
                          title: Text(customer.companyName),
                          leading: Icon(
                            Icons.person_outline_outlined,
                            color: Colors.black,
                          ),
                        ));
                  },
                );
              } else {
                return Text("Loading");
              }
            }));
  }
}
