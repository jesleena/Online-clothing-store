import 'package:flutter/material.dart';
import 'package:flutter_classwork/stateManagement_provider/provider/movieprovider.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlistt = context.watch<MovieProvider>().wishmovie;

    return Scaffold(
      appBar: AppBar(
        title: Text('WishList ${wishlistt.length}'),
      ),
      body: ListView.builder(
          itemCount: wishlistt.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(wishlistt[index].title),
                subtitle: Text(wishlistt[index].time ?? 'No Time'),
                trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(wishlistt[index]);
                    },
                    child: Text("Remove")),
              ),
            );
          }),
    );
  }
}