import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';

import 'package:grocery_app/providers/image_provider.dart';
import 'package:grocery_app/providers/single_item_provider.dart';
import 'package:grocery_app/widgets/featured_widget.dart';
import 'package:grocery_app/widgets/freshArrivals_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final featuredProducts = [
      ...Provider.of<ShoppingItems>(context,listen:false).featuredProducts
    ];
    final bestValues = [
      ...Provider.of<ShoppingItems>(context, listen: false).bestValues
    ];
    final carouselImages = Provider.of<ProvidesImages>(
      context,
      listen: false,
    ).carouselImages;
    final categoryImages =
        Provider.of<ProvidesImages>(context, listen: false).shopByCategory;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20, width: double.infinity),
            CarouselSlider(
                height: MediaQuery.of(context).size.height * 0.30,
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                items: carouselImages
                    .map((data) => Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 7),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black45, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[500],
                                        offset: Offset(5, 5),
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
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          data['imagePath'],
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 23,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    height: 90,
                                    width: 225,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.83),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40)),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${data['offerPercentage']}% OFF',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Buy More and Save More',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            '${data['category']}',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  right: 15,
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Colors.deepOrange[300],
                                            Colors.deepOrange[400],
                                            Colors.deepOrange[600],
                                            Colors.deepOrange[900],
                                          ]),
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(13),
                                      ),
                                    ),
                                    child: Center(
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Shop Now',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                  ),
                                ),
                              ],
                            );
                          },
                        ))
                    .toList()),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 17, bottom: 2),
              child: Text(
                'Shop by ',
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
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.19,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryImages.length,
                itemBuilder: (context, index) => InkWell(
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductsGrid(
                              title: categoryImages[index]['category'],
                              products: [
                                ...Provider.of<ShoppingItems>(context)
                                    .searchByCategory(
                                    categoryImages[index]['category'])
                              ],
                            )),);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      left: 14,
                      right: 5,
                    ),
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                          width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                  categoryImages[index]['imageUrl'],
                                  fit: BoxFit.fill)),
                        ),
                        FittedBox(
                          child: Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              '${categoryImages[index]['category']}',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FeatureWidget(
              title: 'Featured Products',
              products: featuredProducts,
            ),
            FreshArrivals(
              title: 'Fresh Arrivals',
            ),
            SizedBox(
              height: 10,
            ),
            FeatureWidget(
              title: 'Best Values ',
              products: bestValues,
            ),
          ],
        ),
      ),
    );
  }
}
