
import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/single_cart_item.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.95),
      body: Align(
        alignment:Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.065,
                  width: constraints.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:()=>Navigator.of(context).pop(),
                        child: Container(
                          height: constraints.maxHeight * 0.05,
                          width: constraints.maxWidth * 0.09,
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(4, 4),
                                  blurRadius: 4.0,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(4, 4),
                                  blurRadius: 4.0,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(3))),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                            size: 19,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.25,
                      ),
                      Text(
                        'Cart Items',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            wordSpacing: 3),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    color: Colors.transparent,
                    onPressed: () {},
                    child: Text(
                      ' + Add more Items',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.75,
                  width: constraints.maxWidth * 0.91,
                  child: Consumer<CartItems>(
                    builder: (context, cartPath, child) =>
                        cartPath.cartProducts.length == 0
                            ? Center(
                                child: Text('Add '
                                    'More'),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(
                                  top: 0,
                                ),
                                itemCount: cartPath.cartProducts.length,
                                itemBuilder: (context, index) => CartItem(
                                  maxHeight: constraints.maxHeight,
                                  maxWidth: constraints.maxWidth,
                                  prodId: cartPath.cartProducts[index].cartId,
                                  prodName: cartPath.cartProducts[index].cartName,
                                  prodImageUrl:
                                      cartPath.cartProducts[index].cartImageUrl,
                                  weightCategory: cartPath.cartProducts[index].weightCategory,

                                  orderedQuantity:
                                      cartPath.cartProducts[index].selectedNumber,
                                  orderedWeight:
                                      cartPath.cartProducts[index].selectedWeight,
                                  totalPrice: cartPath.cartProducts[index].price,
                                ),
                              ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.11,
                  width: constraints.maxWidth,
                  padding:EdgeInsets.only(left: 8,right: 8,bottom:3),
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),),
                  ),
                  child: Consumer<CartItems>(
                    builder:(ctx,cartPath,child)=> Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(''
                                'Selected Item-${cartPath.cartProducts.length}',style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 15,

                            )),
                            Text('Total amount:${cartPath.totalPriceOfCart().toString} ',style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 15,

                            )),

                          ],
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          width: constraints.maxWidth*0.8,
                          alignment:Alignment.center,
                          decoration:BoxDecoration(
                            color:Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                          child:Text('Check Out',style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Colors.white,))
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
