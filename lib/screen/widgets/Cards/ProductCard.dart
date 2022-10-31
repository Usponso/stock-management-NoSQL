import 'package:flutter/material.dart';

import '../../../modal/Device.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.device}) : super(key: key);

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
              color: Colors.grey.shade500, width: 0.4)),
      elevation: 0,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              child: Image.network(
                device.picture,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(children: [
              Text(
                device.name,
                style:
                TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'Numéro de série : ${device.serialNumber}'),
              Text('Prix : ${device.price} €'),
              Text(
                  'Quantité en stock : ${device.stockQuantity}'),
            ])
          ],
        ),
      ),
    );
  }
}
