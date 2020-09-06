import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/providers/single_item_provider.dart';
import 'package:grocery_app/providers/total_calculating_events_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  @required
  final maxHeight;
  @required
  final maxWidth;
  @required
  final int prodId;
  @required
  final String prodName;
  @required
  final String prodImageUrl;
  @required
  final int orderedQuantity;
  @required
  final int orderedWeight;
  @required
  final int weightCategory;
  @required
  final double totalPrice;

  CartItem({
    this.maxHeight,
    this.maxWidth,
    this.prodId,
    this.prodName,
    this.prodImageUrl,
    this.orderedQuantity,
    this.orderedWeight,
    this.weightCategory,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final cartProviderPath = Provider.of<CartItems>(context, listen: false);
    final List<String> weightUnit =
        Provider.of<ShoppingItems>(context, listen: false).weightUnit;
    return SizedBox(
      height: maxHeight * 0.215,
      child: Column(
        children: [
          Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red,
              ),
              child: Icon(Icons.delete, color: Colors.white, size: 40),
            ),
            confirmDismiss: (direction) {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Are you sure'),
                      titlePadding: EdgeInsets.all(3),
                      content: Text('You want to remove ?'),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                      actions: [
                        FlatButton(
                          textColor: Colors.redAccent,
                          child: Text(
                            'NO',
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            'Yes',
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  });
            },
            onDismissed: (direction) {
              cartProviderPath.removeCartProduct(prodId);
            },
            child: Container(
              height: maxHeight * 0.2,
              width: maxWidth * 0.9,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(4, 4),
                    blurRadius: 2.0,
                    spreadRadius: 0.5,
                  ),
                  BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(4, 4),
                    blurRadius: 2.0,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: LayoutBuilder(
                builder: (context, constraint) => Row(
                  children: [
                    Container(
                      height: constraint.maxHeight * 0.8,
                      width: constraint.maxWidth * 0.35,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Image.asset(
                        prodImageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      height: constraint.maxHeight * 0.78,
                      width: constraint.maxWidth * 0.32,
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: constraint.maxHeight * 0.2,
                            child: prodName.length > 8
                                ? FittedBox(
                                    child: Text(
                                      prodName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  )
                                : Text(
                                    prodName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${orderedWeight.toString()} ${weightUnit[weightCategory]}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: constraint.maxHeight * 0.27,
                            width: constraint.maxWidth * 0.28,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.65),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Consumer2<CartItems, ProductEvents>(
                              builder: (ctx, cartPath, eventsPath, child) =>
                                  Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      eventsPath.decrement();
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    orderedQuantity.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      eventsPath.decrement();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(left: 12, bottom: 15, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Rs $totalPrice'.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: maxHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
