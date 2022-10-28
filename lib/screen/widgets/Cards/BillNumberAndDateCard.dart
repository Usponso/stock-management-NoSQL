import 'package:flutter/material.dart';

class BillNumberAndDateCard extends StatefulWidget {
  const BillNumberAndDateCard(
      {Key? key, required this.billDate, required this.idBill})
      : super(key: key);
  final int idBill;
  final String billDate;

  @override
  State<BillNumberAndDateCard> createState() => _BillNumberAndDateCardState();
}

class _BillNumberAndDateCardState extends State<BillNumberAndDateCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )));
  }
}
