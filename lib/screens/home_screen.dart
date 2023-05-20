import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/controller/products_controller.dart';

class HomeScreen extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  List categories = ["TShirt", "Pants", "Jeans", "Jackets", "Shirt"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            _buildCategoriesRow(),
            Expanded(
              child: Obx(() {
                if (productsController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (productsController.products.isEmpty) {
                  return const Center(
                    child: Text("No found Product"),
                  );
                }
                if(productsController.isGridView.value){
                  print("IsGridView ${productsController.isGridView.value}");
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: productsController.products.length,
                    itemBuilder: (context, index) {
                      var product = productsController.products[index];
                      return Card(
                        elevation: 0,
                        child: Container(
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Container(
                                width: 140,
                                height: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          product['image'],
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${product['title']} ",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                          child: Text(
                                            "${product['description']}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      Text("\$${product['price']}"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7
                  ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: productsController.products.length,
                  itemBuilder: (context, index) {
                    var product = productsController.products[index];
                    return Card(
                      elevation: 0,
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        product['image'],
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${product['title']} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "${product['description']}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    Text("\$${product['price']}"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          onPressed: () {
            productsController.toggleGrid();
          },
          icon: const Icon(
            Icons.filter_list,
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
          itemBuilder: (context, index) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                  color: index == 0 ? Colors.black87 : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                categories[index],
                style:
                    TextStyle(color: index == 0 ? Colors.white : Colors.black),
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
