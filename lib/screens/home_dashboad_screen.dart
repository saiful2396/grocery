import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/categories.dart';
import '../model/product.dart';
import '../screens/cart_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/login_screen.dart';
import '../screens/shop_screen.dart';
import '../util/shopping_colors.dart';
import '../widgets/nav_drawer.dart';

class HomeDashBoardScreen extends StatefulWidget {
  @override
  _HomeDashBoardScreenState createState() => _HomeDashBoardScreenState();
}

class _HomeDashBoardScreenState extends State<HomeDashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  List<Product> _categoryProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget navigateToScreen() {
     switch(_currentIndex) {
       case 0:
         return ShopScreen(categoryClick: (String categoryId) {
            setState(() {
              _categoryProducts = Provider.of<Categories>(context, listen: false).getProductsById(context, categoryId);
              _currentIndex = 1;
            });
         },);
       case 1:
         return ExploreScreen(categoryProducts: _categoryProducts,);
       case 2:
         return CartScreen();
       case 3:
         return FavScreen();
     }
     return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        // elevation: 0,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.network(
                'https://raw.githubusercontent.com/saiful2396/saiful2396.github.io/master/shopping_assets/images/user.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return LoginUI();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
        backgroundColor: shrineGreen400,
        title: Text(
          'Find Products',
          style: TextStyle(fontFamily: 'Gilroy'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: shrineGreen400,
        foregroundColor: Colors.white,
        child: new Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: shrineGreen100,
        selectedItemColor: shrineGreen400,
        currentIndex: _currentIndex,
        // backgroundColor: colorScheme.surface,
        // selectedItemColor: colorScheme.onSurface,
        // unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        // selectedLabelStyle: textTheme.caption,
        // unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: navigateToScreen(),
    );
  }
}
