import 'dart:math';
import 'package:flutter/material.dart';
import '../model/movie.dart';

final List<Movie> movieList = List.generate(100, (index) =>
    Movie(title: 'Movie $index',
        time: "${Random().nextInt(100) + 60} minutes"
         ));
//change notifier monitor the changes in ui and update it to the provider

class MovieProvider extends ChangeNotifier{

  final List<Movie> _movies = movieList;
  List<Movie> get  movies => _movies;//getter to access list of movies in home page

  final List<Movie> _wishlist = [];
  List<Movie> get wishmovie => _wishlist;

  void addToList(Movie moviefromMain){
    _wishlist.add(moviefromMain);
    notifyListeners();
  }
  void removeFromList(Movie removedMovie){
    _wishlist.remove(removedMovie);
    notifyListeners();
  }
}