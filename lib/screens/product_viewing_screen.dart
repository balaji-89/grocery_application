import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Favourites_provider.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/providers/single_item_provider.dart';
import 'package:grocery_app/providers/total_calculating_events_provider.dart';

class ProductViewingScreen extends StatelessWidget {
  final int id;

  ProductViewingScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final List<String> weightUnit=Provider.of<ShoppingItems>(context,listen:false).weightUnit;
    final IndividualItem displayProduct =
        Provider.of<ShoppingItems>(context, listen: false).findById(id);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.04,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.08,
                width: constraints.maxWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 5),
                      icon: Icon(Icons.arrow_back_ios,
                          size: 22, color: Theme.of(context).primaryColor),
                      onPressed: () {
                        Provider.of<ProductEvents>(context, listen: false)
                            .selectedIndex = 0;
                        Provider.of<ProductEvents>(context, listen: false)
                            .numberOfProducts = 1;
                        Navigator.of(context).pop();
                      },
                    ),
                    Spacer(),
                    SizedBox(width: 15),
                    Consumer<CartItems>(
                      builder:(context,cartPath,child)=> Stack(
                        children: [
                          IconButton(
                              padding: EdgeInsets.only(right: 5),
                              icon: Icon(Icons.shopping_cart,
                                  size: 24, color: Theme.of(context).primaryColor),
                              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(),))),
                          Positioned(
                            right:3,
                            top: 5,
                            child:  cartPath.cartProducts.length==0?SizedBox():CircleAvatar(
                              backgroundColor:Colors.deepOrange.withOpacity(0.6),
                              radius: 9,
                              child: Text('${cartPath.cartProducts.length}',style:TextStyle(color:Theme.of(context).backgroundColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: constraints.maxHeight * 0.33,
                  width: constraints.maxWidth * 0.7,
                  child: Image.asset(
                    displayProduct.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.55,
                width: constraints.maxWidth,
                padding: EdgeInsets.only(left: 10, right: 13, bottom: 2),
                margin: EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.deepOrange.withOpacity(0.8), width: 1.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      25,
                    ),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 10),
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.15,
                      width: constraints.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: constraints.maxHeight * 0.05,
                                width: constraints.maxWidth * 0.55,
                                child: Text(
                                  displayProduct.productName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Text(
                                'Available Weights',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              Spacer(),
                              Container(
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxHeight * 0.055,
                                child: Consumer<ProductEvents>(
                                  builder: (context, object, child) =>
                                      ListView.builder(
                                    padding: EdgeInsets.only(left: 1, top: 2),
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        displayProduct.availableWeights.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        object.selectingIndex(index);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: 4),
                                        height: constraints.maxHeight * 0.025,
                                        width: constraints.maxWidth * 0.15,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black45,
                                              width: 1.2),
                                          color: object.selectedIndex == index
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.7)
                                              : Colors.grey[400],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Text(
                                          '${displayProduct.availableWeights[index]} kg',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            height: constraints.maxHeight * 0.14,
                            width: constraints.maxWidth * 0.1,
                            child: Consumer<ProductEvents>(
                              builder: (context, providerPath, child) => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      providerPath.increment();
                                    },
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${providerPath.numberOfProducts}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      providerPath.decrement();
                                    },
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Description',
                            style: TextStyle(
                              letterSpacing: 0.7,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ))),
                    SizedBox(
                      height: constraints.maxHeight * 0.12,
                      width: constraints.maxWidth * 0.85,
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: 0,
                        ),
                        children: [
                          Text(
                            '${displayProduct.description}',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      height: constraints.maxHeight * 0.11,
                      width: constraints.maxWidth * 0.7,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                      child: Consumer<ProductEvents>(
                        builder: (context, providerPath, child) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weight you Selected  ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  '${displayProduct.availableWeights[providerPath.selectedIndex]} ${weightUnit[displayProduct.weightCategory]}',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Number of products  ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'x ${providerPath.numberOfProducts}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      displayProduct.discountedAmount != null
                                          ? 'Rs ${(displayProduct.discountedAmount * (providerPath.selectedIndex + 1)) * providerPath.numberOfProducts}'
                                          : 'Rs ${(displayProduct.originalPrice * (providerPath.selectedIndex + 1)) * providerPath.numberOfProducts}',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      displayProduct.discountedAmount != null
                                          ? '${displayProduct.originalPrice * (providerPath.selectedIndex + 1) * providerPath.numberOfProducts}'
                                          : '  ',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black45,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer2<ShoppingItems, FavouritesList>(
                          builder:
                              (context, shoppingPath, favouritePath, child) => RaisedButton(
                               shape: RoundedRectangleBorder(
                               borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            color: Colors.white.withOpacity(0.65),
                            elevation: 3,
                            child: Icon(
                              displayProduct.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              if (displayProduct.isFavourite) {
                                shoppingPath.changeFavouriteOfaProducts(
                                    displayProduct.productId);
                                favouritePath.removeFavouriteItem(
                                    displayProduct.productId);
                              } else {
                                shoppingPath.changeFavouriteOfaProducts(
                                    displayProduct.productId);
                                favouritePath.addFavouriteItem(
                                    displayProduct.productId,
                                    displayProduct.imageUrl,
                                    displayProduct.productName,
                                    displayProduct.weight,
                                    displayProduct.discountedAmount,
                                    displayProduct.weightCategory,
                                    displayProduct.originalPrice);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.45,
                          child: Consumer2<ProductEvents, CartItems>(
                            builder: (ctx, productPath, cartPath, child) =>
                                RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              elevation: 5,
                              color: Colors.lightGreen,
                              onPressed: () => cartPath.checkingCartItems(
                                      displayProduct.productId)
                                  ? {}
                                  : {
                                      cartPath.addCartProd(
                                          displayProduct.productId,
                                          displayProduct.productName,
                                          displayProduct.imageUrl,
                                          displayProduct.availableWeights[
                                              productPath.selectedIndex],
                                          displayProduct.weightCategory,
                                          productPath.numberOfProducts,
                                          displayProduct.originalPrice,
                                          displayProduct.discountedAmount),
                                    
                                    },
                              icon: cartPath.checkingCartItems(
                                      displayProduct.productId)
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                              label: cartPath.checkingCartItems(
                                      displayProduct.productId)
                                  ? Text(
                                      'Added to cart',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      'Add to cart',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
