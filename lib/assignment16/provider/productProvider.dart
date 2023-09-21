
import 'package:flutter/material.dart';
import 'package:flutter_classwork/assignment16/model/product.dart';

List<Product> fishList = [
  Product(name: "Sardine", price: 120, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/m/a/mathi_whole_510g_special.jpg"),
  Product(name: "Rohu", price: 100, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/r/o/rohu_12.jpg"),
  Product(name: "Tuna", price: 500, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/t/u/tuna_whole_3.jpg"),
  Product(name: "Prawns", price: 800, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/i/n/indian_prawns_whole11169_4__2_3.jpg"),
  Product(name: "Mackerel", price: 150, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/m/a/mackerel_whole_1.jpg"),
  Product(name: "King Fish", price: 210, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/n/e/neymeen_parava_whole_.jpg"),
  Product(name: "Red Snapper", price: 200, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/r/e/red-snapper_big.jpg"),
];
List<Product> marinatedList = [
  Product(name: "Chicken Tikka", price: 250, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/c/h/chicken_tandoori_tikka_catalogue_images_1.jpg"),
  Product(name: "Fish Tikka", price: 200, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/b/a/baasa_green_marinade.jpeg"),
  Product(name: "Mutton Kebab", price: 400, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/d/e/delhi_6_mutton_seekh_kebab.jpg"),
  Product(name: "Chicken Malai Tikka", price: 300, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/c/h/chicken_malai_tikka_catalogue_imagesnew250gms_1.jpg"),
 ];

List<Product> meatList = [
  Product(name: "Chicken", price: 250, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/c/h/chicken_curry_480g_to_500g.jpg"),
  Product(name: "Beef", price: 350, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/g/o/goat_boneless_1_2.jpg"),
  Product(name: "Mutton", price: 500, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/m/u/mutton_rib_bones_1.jpg"),
  Product(name: "Duck", price: 300, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/d/r/drumsticks_with_skin.jpeg"),
  ];

List<Product> readytocookList = [
  Product(name: "Chicken Samosa", price: 100, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/m/a/malabar_chicken_samosa.jpg"),
  Product(name: "Chicken Cutlet", price: 120, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/y/u/yummy_chicken_cutlets.jpg"),
  Product(name: "Chicken Spring Role", price: 120, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/c/a/cajun-chicken-spring-roll.jpg"),
  Product(name: "Fish Cutlet", price: 100, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/c/u/cutlets3.jpg"),
  Product(name: "Mutton Cutlet", price: 150, image: "https://static.freshtohome.com/media/catalog/product/cache/0/image/600x400/18ae109e34f485bd0b0c075abec96b2e/y/u/yummy_mutton_cutlets.jpg"),
  ];


class ProductProvider extends ChangeNotifier {
int? tprice=0;
  final List<Product> _fish = fishList;

  List<Product> get fish => _fish; //getter to access list of fish in home page

  final List<Product> _meat = meatList;

  List<Product> get meat => _meat; //getter to access list of meat in home page

  final List<Product> _marinated = marinatedList;

  List<Product> get marinated =>
      _marinated; //getter to access list of marinated in home page

  final List<Product> _readytocook = readytocookList;

  List<Product> get readytocook =>
      _readytocook; //getter to access list of readytocook in home page

  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  int total = 0;

  void addToList(Product productfromMain) {
    int index = _cart.indexWhere((element) => element == productfromMain);
    if (index != -1) {
      _cart[index].count = _cart[index].count + 1;
      notifyListeners();

    } else {
      _cart.add(productfromMain);
     notifyListeners();
    }
  }

  void removeFromList(Product removeproduct) {
  //  int index = _cart.indexWhere((element) => element == removeproduct);
    if ( removeproduct.count>1) {
      removeproduct.count = removeproduct.count - 1;
      notifyListeners();
    } else {
      _cart.remove(removeproduct);
      notifyListeners();
    }
  }
}
/*
void addToList(Product productfromMain){
    _cart.forEach((element){
      if(element==productfromMain){
        element.count=element.count+1;
      }
      else{
    _cart.add(productfromMain);
    //total=total+element.price*count;
    notifyListeners();
  }});}

 */