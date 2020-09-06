import 'package:flutter/material.dart';



import 'package:grocery_app/screens/tab_menu_screen.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/offers_screen.dart';
import 'package:grocery_app/screens/orderTracking_screen.dart';
import 'package:grocery_app/screens/profile_screen.dart';




class BottomTabBar with ChangeNotifier{
  final List navigatingPages=[
    TabMenuItem(),
    OfferScreen(),
    HomeScreen(),
    OrderTrackingScreen(),
    ProfileScreen(),

  ];
   var body=2;
   switchingPages(int index){
    body= index;
    notifyListeners();
  }


}