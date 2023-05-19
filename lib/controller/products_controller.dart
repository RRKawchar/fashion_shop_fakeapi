import 'package:get/get.dart';
import 'package:shop_app_getx/controller/product_repository.dart';

class ProductsController extends GetxController{

  ProductRepository productRepository=ProductRepository();
  List products=[].obs;
  productsController(){
    productsFromApi();
  }
  productsFromApi()async{
    products=await productRepository.loadProductFromApi();


    print(products);
  }



}