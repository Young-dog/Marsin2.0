import 'package:flutter/material.dart';
import 'package:marsin/widgets/screen_add_desert.dart';

class DesertCategoriesForPC extends StatefulWidget {
  const DesertCategoriesForPC({Key? key}) : super(key: key);

  @override
  State<DesertCategoriesForPC> createState() => _DesertCategoriesForPCState();
}

class _DesertCategoriesForPCState extends State<DesertCategoriesForPC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text("Категории"),
          Container(
            width: 5,
            height: 5,
            child: GridView.builder(itemCount: 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ), itemBuilder: (context, index) {
              return Container();
            }),
          ),
          IconButton(onPressed: () async {
            Navigator.of(context).pushNamed(AddDesertScreen.id);
          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
