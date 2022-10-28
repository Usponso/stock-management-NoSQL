import 'package:flutter/material.dart';

class CompanyCard extends StatefulWidget {
  const CompanyCard({Key? key, required this.companyName, required this.siret, required this.phoneNumber}) : super(key: key);
  final String companyName, siret, phoneNumber;

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
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
                "${widget.companyName}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
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
            )));
  }
}
