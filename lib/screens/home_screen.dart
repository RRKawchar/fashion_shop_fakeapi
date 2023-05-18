import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  List categories=[
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTop(),
                _buildCategoriesRow()
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildTop() {
    return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Cloths",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_alt,
                    ),
                  )
                ],
              );
  }

  Container _buildCategoriesRow() {
    return Container(
                height: 35,
                margin: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                  return  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                        color:index==0? Colors.black87:Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text(
                      categories[index],style: TextStyle(color:index==0? Colors.white:Colors.black),
                    ),
                  );
                }),
              );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "Fashion Shop",
        style: TextStyle(color: Colors.black),
      ),
      leading: const BackButton(),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ],
    );
  }
}
