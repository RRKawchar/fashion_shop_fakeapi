import 'package:get/get.dart';
import 'package:shop_app_getx/controller/product_repository.dart';

class ProductsController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  List products = [].obs;
  var isLoading = false.obs;
  var isGridView=false.obs;
  productsController() {
    productsFromApi();
  }

  productsFromApi() async {
    isLoading(true);
    products = await productRepository.loadProductFromApi();
    isLoading(false);
  }

  toggleGrid(){
    isGridView(!isGridView.value);
  }

  @override
  void onInit() {
   productsFromApi();
    super.onInit();
  }
}
