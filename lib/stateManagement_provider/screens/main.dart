import 'package:flutter/material.dart';
import 'package:flutter_classwork/stateManagement_provider/provider/movieprovider.dart';
import 'package:flutter_classwork/stateManagement_provider/screens/wishlist.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider<MovieProvider>(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        home: Homee(),
      ),
    ),
  );
}

class Homee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movie_to_wishlist = context.watch<MovieProvider>().wishmovie;
    var movies = context.watch<MovieProvider>().movies;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WishList()));
                  },
                  icon: Icon(Icons.favorite),
                  label: Text("WishList ${movie_to_wishlist.length}")),
              Expanded(
                  child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        //movies is list of map
                        final currentmovie = movies[index];
                        return Card(
                          child: ListTile(
                            title: Text(currentmovie.title),
                            subtitle: Text(currentmovie.time ?? 'No Time'),
                            trailing:
                            IconButton(
                                onPressed: () {
                                  if(!movie_to_wishlist.contains(currentmovie)){
                                    /// movie add to wishlist and update favorite icon color
                                    context.read<MovieProvider>().addToList(currentmovie);
                                  }else{
                                    context.read<MovieProvider>().removeFromList(currentmovie);
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color:
                                  movie_to_wishlist.contains(currentmovie)
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}