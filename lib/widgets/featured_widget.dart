import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Favourites_provider.dart';
import 'package:provider/provider.dart';

import 'package:grocery_app/providers/single_item_provider.dart';
import 'package:grocery_app/widgets/products_grid.dart';

class FeatureWidget extends StatelessWidget {
  final String title;
  final List<IndividualItem> products;

  FeatureWidget({this.products, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 17, bottom: 2),
                    child: Text(
                      'You may also like our',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      '$title',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductsGrid(
                        title: '$title',
                        products: [...products],
                      ),
                    )),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20, right: 13),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.deepOrange[400],
                          Colors.deepOrange[400],
                          Colors.deepOrange[600],
                          Colors.deepOrange[900],
                        ]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(4, 4),
                        blurRadius: 4.0,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 4.0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    'View all >>',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                width: 2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      width: 2,
                    ),
                  )),
                  alignment: Alignment.center,
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: constraints.maxHeight * 0.7,
                        width: constraints.maxWidth * 0.46,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              '${products[0].imageUrl}',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            child: Text(
                          '${products[0].productName}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            child: Text(
                          '${products[0].weight} ${Provider.of<ShoppingItems>(context,listen:false).weightUnit[products[0].weightCategory]}',
                          style: TextStyle(color: Colors.black54, fontSize: 10),
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.07,
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Rs ${products[0].discountedAmount}  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '${products[0].originalPrice}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Consumer2<ShoppingItems,FavouritesList>(
                              builder: (context, providerPath,favouritePath,rebuilds) {
                                return InkWell(
                                  onTap: () {
                                    if (products[0].isFavourite) {
                                      providerPath.changeFavourites(
                                          products[0].productId, products);
                                      favouritePath.removeFavouriteItem(
                                          products[0].productId);


                                    } else {
                                      providerPath.changeFavourites(
                                          products[0].productId, products);
                                      favouritePath.addFavouriteItem(
                                      products[0].productId,
                                      products[0].imageUrl,
                                      products[0].productName,
                                      products[0].weight,
                                      products[0].discountedAmount,
                                      products[0].weightCategory,
                                      products[0].originalPrice
                                      );
                                      }

                                  },
                                  child: Container(
                                    margin:EdgeInsets.all(5),
                                      child: Icon(
                                    (products[0].isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border),
                                    size: 25,
                                    color: Theme.of(context).accentColor,
                                  )),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.5,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ),
                        height: constraints.maxHeight * 0.5,
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: constraints.maxHeight * 0.29,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    '${products[1].imageUrl}',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              child: Text(
                                '${products[1].productName}',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Consumer<ShoppingItems>(
                                builder: (context, providerPath, child) {
                              return Container(
                                margin: EdgeInsets.only(left: 14),
                                child: Text(
                                  '${products[1].weight} ${providerPath.weightUnit[products[0].weightCategory]}',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            }),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              alignment: Alignment.topCenter,
                              height: constraints.maxHeight * 0.1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Rs ${products[1].discountedAmount}  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '${products[1].originalPrice}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Spacer(),
                                  Consumer2<ShoppingItems, FavouritesList>(
                                    builder: (context, providerPath,
                                        favouritePath, rebuilds) {
                                      return InkWell(
                                        onTap: () {
                                          if (products[1].isFavourite) {
                                            providerPath.changeFavourites(
                                                products[1].productId,
                                                products);
                                            favouritePath.removeFavouriteItem(
                                                products[1].productId);
                                          } else {
                                            providerPath.changeFavourites(
                                                products[1].productId,
                                                products);
                                            favouritePath.addFavouriteItem(
                                                products[1].productId,
                                                products[1].imageUrl,
                                                products[1].productName,
                                                products[1].weight,
                                                products[1].discountedAmount,
                                                products[1].weightCategory,
                                                products[1].originalPrice
                                            );
                                          }
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              (products[1].isFavourite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border),
                                              size: 24,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: constraints.maxHeight * 0.3,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset(
                                    '${products[2].imageUrl}',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              child: Text(
                                '${products[2].productName}',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Consumer<ShoppingItems>(
                                builder: (_, providerPath, child) => Container(
                                      margin: EdgeInsets.only(left: 14),
                                      child: Text(
                                        '${products[2].weight} ${providerPath.weightUnit[products[0].weightCategory]}',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              alignment: Alignment.center,
                              height: constraints.maxHeight * 0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Rs ${products[2].discountedAmount}  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '${products[2].originalPrice}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Spacer(),
                                  Consumer2<ShoppingItems,FavouritesList>(
                                    builder: (context, providerPath, favouritePath,rebuilds) {
                                      return InkWell(
                                        onTap: () {
                                          if (products[2].isFavourite) {
                                            providerPath.changeFavourites(
                                                products[2].productId,
                                                products);
                                            favouritePath.removeFavouriteItem(
                                                products[2].productId);
                                          } else {
                                            providerPath.changeFavourites(
                                                products[2].productId,
                                                products);
                                            favouritePath.addFavouriteItem(
                                            products[2].productId,
                                            products[2].imageUrl,
                                            products[2].productName,
                                            products[2].weight,
                                            products[2].discountedAmount,
                                                products[2].weightCategory,
                                                products[2].originalPrice);
                                            }

                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(right: 14),
                                            child: Icon(
                                              (products[2].isFavourite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border),
                                              size: 24,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
