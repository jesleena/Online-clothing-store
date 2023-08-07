import 'package:get/get.dart';
import '../services/httpservice.dart';
class ProductController extends GetxController{
  RxBool isLoading = true.obs; // here isLoading is now in observable state
  var productList = [].obs;

  @override
  void onInit() {
    loadProducts();  // to fetch data from service class
    super.onInit();
  }

  void loadProducts()  async{
    try{
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if(products != null){
        productList.value = products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }

}