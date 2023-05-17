import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Row(
            children: [
            Expanded(

              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Cloths"),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down),)
                  ],
                ),
              ),
            )
            ],
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text("Fashion Shop",style: TextStyle(color: Colors.black),),
      leading: const BackButton(),
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined,),),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,),),
      ],
    );
  }
}
