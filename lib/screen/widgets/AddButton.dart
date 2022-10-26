import 'package:flutter/material.dart';
import 'package:stock_management/screen/widgets/AddCustomerForm.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddCustomerForm();
            });
      },
      backgroundColor: Colors.deepPurple[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.add),
    );
  }
}
