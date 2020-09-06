import 'package:flutter/material.dart';
import 'package:grocery_app/providers/single_item_provider.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/providers/Favourites_provider.dart';

class FavouriteList extends StatelessWidget {
  static const routeName='/favouriteScreen';
  @override
  Widget build(BuildContext context) {
    final List favouriteList = [
      ...Provider.of<FavouritesList>(context).favouritesList
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(9))),
      ),
      body: favouriteList.isEmpty
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/appbar_profile/nothing_chick.png',
                      ),
                    ),
                    Text(
                      'Nothing to show',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'you !!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: LayoutBuilder(
                builder: (context, constraints) => ListView.builder(
                    itemCount: favouriteList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              padding: EdgeInsets.only(right: 15),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.red,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 20),
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size:15),
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 10),

                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 8),

                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 5),
                                  SizedBox(width: 10,),
                                  Icon(Icons.delete,
                                      color: Colors.white, size: 40),

                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              Provider.of<ShoppingItems>(context)
                                  .removeFavouritesFromFavouriteScreen(
                                  favouriteList[index].id);

                              Provider.of<FavouritesList>(context)
                                  .removeFavouriteItem(favouriteList[index].id);

                            },

                            child: Container(
                              height: constraints.maxHeight * 0.17,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).accentColor,
                                    width: 0.7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: constraints.maxHeight * 0.15,
                                    width: constraints.maxWidth * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: Image.asset(
                                        favouriteList[index].imagePath,
                                        fit: BoxFit.cover),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${favouriteList[index].productName}',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '${favouriteList[index].quantity} ${Provider.of<ShoppingItems>(context, listen: false).weightUnit[favouriteList[index].weightCategory]}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: constraints.maxWidth * 0.65,
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Rs ${favouriteList[index].price} ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                '${favouriteList[index].originalPrice}',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 13,
                                                    color: Colors.grey)),
                                            Spacer(),
                                            FlatButton(
                                              color:
                                                  Theme.of(context).accentColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                Radius.circular(10),
                                              )),
                                              onPressed: () {},
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .backgroundColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      );
                    }),
              ),
            ),
    );
  }
}
