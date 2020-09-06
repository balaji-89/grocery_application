import 'package:flutter/material.dart';

class Favourites {
  int id;
  String imagePath;
  String productName;
  int quantity;
  double price;
  int weightCategory;
  double originalPrice;


  Favourites(
      {this.id, this.imagePath, this.productName, this.quantity, this.price,this.weightCategory, this.originalPrice});
}

class FavouritesList with ChangeNotifier {
  List<Favourites> favouritesList = [];

  void addFavouriteItem(int receivedId, String image, String productName,
      int receivedQuantity, double receivedPrice,int weightCategory,double originalPrice) {
    favouritesList.add(Favourites(
        productName: productName,
        quantity: receivedQuantity,
        price: receivedPrice,
        id: receivedId,
        imagePath: image,
         weightCategory: weightCategory,
         originalPrice: originalPrice));
    notifyListeners();
  }

  void removeFavouriteItem(int id) {
    favouritesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }



}
