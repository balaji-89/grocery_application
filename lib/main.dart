import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/total_calculating_events_provider.dart';
import 'package:grocery_app/screens/favourite_screen.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import './providers/location_provider.dart';
import './providers/image_provider.dart';
import './providers/single_item_provider.dart';
import './providers/Favourites_provider.dart';
import 'package:grocery_app/providers/bottom_tab_bar_provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => Location(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomTabBar(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProvidesImages(),
      ),
      ChangeNotifierProvider(
        create: (context) => ShoppingItems(),
      ),
      ChangeNotifierProvider(
        create: (context) => FavouritesList(),
      ),
      ChangeNotifierProvider(
      create: (context) => ProductEvents(),
      ),
    ], child: GroceryApp()),);

class GroceryApp extends StatefulWidget {
  @override
  _GroceryAppState createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  int currentIndex = 0;

  String shopName = 'Balaji\'s market';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.exo2TextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.deepOrange,
          accentColor: Colors.redAccent,
          backgroundColor: Colors.white,
      ),
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      home: Consumer<BottomTabBar>(
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
            padding: EdgeInsets.all(5),
            height: 50,
            width: 35,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(3, 3),
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
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Text('${shopName[0]}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black,
                size: 17,
              ),
              Container(
                child: Consumer<Location>(
                  builder: (context, location, child) =>
                      DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: location.defaultBranch,
                      items: location.storeBranches.map(
                        (branch) {
                          return DropdownMenuItem<String>(
                            value: branch,
                            child: Text(
                              '$branch',
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (branch) => location
                          .branchSelection(branch),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FavouriteAvatar(),
            SizedBox(
              width: 20,
            ),
            PopupMenuButton(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(4, 4),
                      blurRadius: 4.0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.deepOrange,
                  child: Image.asset(
                      'assets/images/appbar_profile/profile_cartoon.png'),
                ),
              ),
              itemBuilder: (ctx) {
                return Provider.of<Location>(context)
                    .myProfileDropdown
                    .map(
                      (item) => PopupMenuItem<String>(

                        value: item['title'].toString(),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: item['icon'],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                item['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList();
              },
              onSelected: (value) {
                switch (value) {
                  case 'DashBoard':
                    {}
                    break;
                  case 'My Orders':
                    {}
                    break;
                  case 'My Wishlist':
                    {}
                    break;
                  case 'My Wallet':
                    {}
                    break;
                  case 'My Address':
                    {}
                    break;
                  case 'Offers':
                    {}
                    break;
                  case 'Faq':
                    {}
                    break;
                  case 'Logout':
                    {}
                    break;
                }
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Column(
              children: <Widget>[
                Container(height: 1, color: Colors.grey.withOpacity(0.5)),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.widgets,
                          color: Colors.black54,
                        ),
                      )),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.deepOrange[300],
                                        Colors.deepOrange[300],
                                        Colors.deepOrange[600],
                                        Colors.deepOrange[900],
                                      ]),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  )),
                              width: 70,
                              height: 80,
                              child: Icon(
                                Icons.shopping_cart,
                                size: 23,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.red[300],
                                      Colors.red[300],
                                      Colors.red[600],
                                      Colors.red[900],
                                    ]),
                                color: Colors.redAccent,
                              ),
                              width: 70,
                              height: 80,
                              child: Icon(
                                Icons.search,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
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
        builder: (context, providerPath, appBarWidget) => Scaffold(
          appBar: appBarWidget,
          body: providerPath.navigatingPages[providerPath.body],
          bottomNavigationBar: BubbleBottomBar(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            elevation: 20,
            backgroundColor: Colors.deepOrange.withOpacity(0.75),
            opacity: 0.99,
            iconSize: 25,
            currentIndex: providerPath.body,
            hasNotch: false,
            hasInk: false,
            onTap: (index) => providerPath.switchingPages(index),
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: Colors.white,
                  title: Text('Files',
                      style: TextStyle(
                        color: Colors.deepOrange.withOpacity(0.8),
                      )),
                  icon: Icon(
                    Icons.style,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(
                    Icons.style,
                    size: 25,
                    color: Colors.deepOrange.withOpacity(0.8),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.white,
                  title: Text('Offers',
                      style: TextStyle(
                        color: Colors.deepOrange.withOpacity(0.8),
                      )),
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(
                    Icons.monetization_on,
                    size: 25,
                    color: Colors.deepOrange.withOpacity(0.8),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.white,
                  title: Text('Home',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      )),
                  icon: Icon(
                    Icons.home,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.deepOrange,
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.deepOrange.withOpacity(0.8),
                  title: Text('Delivery',
                      style: TextStyle(
                        color: Colors.deepOrange.withOpacity(0.8),
                      )),
                  icon: Icon(
                    Icons.local_shipping,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(
                    Icons.local_shipping,
                    size: 25,
                    color: Colors.deepOrange.withOpacity(0.8),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.white,
                  title: Text('Profile',
                      style: TextStyle(
                        color: Colors.deepOrange.withOpacity(0.8),
                      )),
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(
                    Icons.person_outline,
                    size: 25,
                    color: Colors.deepOrange.withOpacity(0.8),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class FavouriteAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FavouriteList())),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(3, 3),
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
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.redAccent.withOpacity(0.4),
                child: Center(
                    child: Icon(
                  Icons.favorite_border,
                  color: Colors.redAccent,
                )),
              ),
            ),
          ),
          Consumer<FavouritesList>(
            builder: (context, providerPath, child) {
              return providerPath.favouritesList.isEmpty
                  ? Positioned(
                  right:2,
                    child: Container(

              ),
                  )
                  : Positioned(
                      right: 2,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.redAccent,
                        child: Text(
                          '${providerPath.favouritesList.length}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
