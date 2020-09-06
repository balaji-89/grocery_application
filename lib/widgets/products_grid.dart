
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Favourites_provider.dart';
import 'package:grocery_app/screens/product_viewing_screen.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/providers/single_item_provider.dart';

class ProductsGrid extends StatefulWidget {
  final String title;
  final List<IndividualItem> products;

  ProductsGrid({@required this.title, @required this.products});

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        //elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(widget.title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            )),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart,size: 20,color: Theme.of(context).primaryColor,), onPressed: null)
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 7, left: 3, right: 3),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (_, constraints) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 4,
            ),
            itemCount: widget.products.length,
            itemBuilder: (context, index) => Container(
              height: constraints.maxHeight * 0.45,
              width: constraints.maxWidth * 0.4,
              padding: EdgeInsets.only(
                top: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.6)),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                    width: constraints.maxWidth * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          right:-0.5,
                          child: SizedBox(
                            height: constraints.maxHeight * 0.2,
                            width: constraints.maxWidth * 0.5,
                            child: Image.asset(
                              '${widget.products[index].imageUrl}',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Consumer2<ShoppingItems, FavouritesList>(
                          builder:
                              (context, providerPath, favouritePath, rebuilds) {
                            return Positioned(
                              right: 5,
                              child: InkWell(
                                onTap: ()
                              {
                                if (widget.products[index].isFavourite) {
                                  providerPath.changeFavourites(
                                      widget.products[index].productId, widget.products);
                                  favouritePath.removeFavouriteItem(
                                      widget.products[index].productId);


                                } else {
                                  providerPath.changeFavourites(
                                      widget.products[index].productId, widget.products);
                                  favouritePath.addFavouriteItem(
                                      widget.products[index].productId,
                                      widget.products[index].imageUrl,
                                      widget.products[index].productName,
                                      widget.products[index].weight,
                                      widget.products[index].discountedAmount,
                                      widget.products[index].weightCategory,
                                      widget.products[index].originalPrice
                                  );
                                }

                              },
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Icon(
                                      (widget.products[index].isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      size: 22,
                                      color: Theme.of(context).accentColor,
                                    )),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.075,
                    width: constraints.maxWidth * 0.5,
                    padding: EdgeInsets.only(bottom: 2.5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(-4, -4),
                            blurRadius: 1.0,
                            spreadRadius: 0.7,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.3),
                          bottomRight: Radius.circular(7.3),
                        ),
                        color: Theme.of(context).primaryColor.withOpacity(0.8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.035,
                              width: constraints.maxWidth * 0.32,
                              child: FittedBox(
                                child: Text(
                                    '${widget.products[index].productName}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.03,
                              width: constraints.maxWidth * 0.3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${widget.products[index].weight} '
                                        '${Provider.of<ShoppingItems>(context, listen: false).weightUnit[widget.products[index].weightCategory]} - ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                      widget.products[index].discountedAmount==null?'Rs  ${widget.products[index].originalPrice}':'Rs  ${widget.products[index].discountedAmount}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductViewingScreen(widget.products[index].productId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
