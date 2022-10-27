import 'package:flutter/material.dart';

class DetailedBill extends StatefulWidget {
  const DetailedBill({Key? key, required this.id, required this.idBill, required this.companyName, required this.siret, required this.phoneNumber, required this.billDate}) : super(key: key);
  final int id, idBill;
  final String companyName, siret, phoneNumber, billDate;


  @override
  State<DetailedBill> createState() => _DetailedBillState();
}

class _DetailedBillState extends State<DetailedBill> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.companyName} - Facture n°${widget.idBill}'),
          backgroundColor: Colors.deepPurple[400],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
              color: Colors.grey[100],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              margin: EdgeInsets.all(5),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      "${widget.companyName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "SIRET : ${widget.siret}  \nTéléphone : ${widget.phoneNumber}",
                      style: TextStyle(fontSize: 16),
                    ),
                    leading: Icon(
                      Icons.person_outline_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ))),
          Card(
              color: Colors.grey[100],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              margin: EdgeInsets.all(5),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      "Numéro de facture: ${widget.idBill} \nDate: ${widget.billDate}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ))),
          Container(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Produit"),
                        Text("Quantité"),
                        Text("Prix"),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: 300,
                                  width: 320,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                          Text("Name"),
                                          Text(""),
                                          Text("2"),
                                          Text("50"),
                                        ]
                                      );
                                      }
                                  ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children : [
                                  Text("Total : 5000 €", textAlign: TextAlign.right,)
                                ]
                              )
                            ])
                      ],
                    )

                  ],
                )),
          ),
          /*Card(
              color: Colors.grey[100],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              margin: EdgeInsets.all(5),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      "Numéro de facture: \nDate:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ))),*/
        ],
      ),
    ));
  }
}
