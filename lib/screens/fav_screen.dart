import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/products.dart';
import '../widgets/fav/FavWidget.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).favoriteItems;
    return Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => FavWidget(
                 product: products[i],
              ),
            ),
          )
        ],
    );
  }
}
