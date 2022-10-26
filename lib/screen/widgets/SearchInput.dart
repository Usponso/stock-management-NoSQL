import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: ListTile(
        leading: Icon(Icons.search),
        //value: fav.searchExpression
        title: TextField(
          onChanged: (value) {
            /* Provider.of<SearchPlantProvider>(context, listen: false).changeSearchExpression(value);*/
          },
          decoration: InputDecoration(
              hintText: 'Search...', border: InputBorder.none),
        ),
      ),
    );
  }
}
