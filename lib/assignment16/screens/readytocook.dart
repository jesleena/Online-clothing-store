import 'package:flutter/material.dart';
import 'package:flutter_classwork/assignment16/provider/productprovider.dart';
import 'package:flutter_classwork/assignment16/screens/cart.dart';
import 'package:provider/provider.dart';


class readytocook_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final cartitems = context.watch<ProductProvider>().cart;
    var rtc = context.watch<ProductProvider>().readytocook;
    return Scaffold(
      appBar: AppBar(
        title: Text("ReadyToCook ",style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
            icon: new Icon(Icons.shopping_cart),
            onPressed: () =>Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart())),
          ),

          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 10,0),
              child: Text('${cartitems.length}',style: Theme.of(context).textTheme.bodySmall,)
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1),
        shrinkWrap: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(5, (index) {
          final currentProduct = rtc[index];
          return
            Card(
              // height: 400,
              margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
              child: Column(

                children: [
                  Container(
                    margin: EdgeInsets.all(3),
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(currentProduct.image),
                        fit: BoxFit.cover,
                      ),),),
                  Container(
                      width: 170,

                      child: Column(children: [
                        Text(currentProduct.name),
                        Text('Rs ${currentProduct.price}/-'),

                        ElevatedButton(
                            onPressed: () {
                              context.read<ProductProvider>().addToList(currentProduct);
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
                            },
                            child:
                            Text("Add ",style: Theme.of(context).textTheme.bodySmall) ),

                      ])),

                ],), );








        } ),),

    );
  }
}