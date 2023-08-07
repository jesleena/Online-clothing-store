import 'package:flutter_classwork/api_dio/model/post_model.dart';
import 'package:flutter_classwork/api_dio/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/animation.dart';


class Product_controller extends GetxController {
  RxList post = RxList();
  RxBool isLoading = true.obs;
  RxBool isListScrollDown = false.obs;
  RxBool isInternetConnected = true.obs;
  var url = "https://jsonplaceholder.typicode.com/posts";

  // to perform scroll action animations etc in scrollable positioned list
  var itemController = ItemScrollController();

  checkifInternetConnected() async
  {
    isInternetConnected.value=await InternetConnectionChecker().hasConnection;
  }
//calling api nd get response
getposts()async{
    checkifInternetConnected();
    isLoading.value=true;
    var response=await DioService().getMethod(url);
    if(response.statusCode==200)
      {
        response.data.forEach((element)
        {
          post.add(ProductModel.fromJson(element));
        });
        isLoading.value=false;
      }
}
  //scroll listView to down
  ScrolltoDown() {
    itemController.scrollTo(
        index: post.length - 5,
        duration: Duration(
          seconds: 2,
        ),
        curve: Curves.linearToEaseOut);
    isListScrollDown.value = true;
  }
//scroll listView to top
  ScrolltoUp(){
    itemController.scrollTo(index: 0,
        duration:Duration(
          seconds: 2,),
        curve: Curves.bounceIn);
    isListScrollDown.value = false;
  }
  // actions perform when the app is loaded
  @override
  void onInit() {
    getposts();
    isInternetConnected();
    super.onInit();
  }
}