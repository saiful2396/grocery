import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/categories.dart';
import '../model/category.dart';
import '../widgets/shop/category_widget.dart';

class ShopScreen extends StatefulWidget {
  final Function categoryClick;

  const ShopScreen({Key key, this.categoryClick}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController editingController = TextEditingController();
  List<Category> _categories;
  bool _isProductListScreen = false;
  String _searchItemId = "";

  @override
  Widget build(BuildContext context) {
    _categories = Provider.of<Categories>(context).items;
    return _isProductListScreen != null
        ? Column(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16.0),
                  itemBuilder: (_, index) {
                    Category category = _categories[index];
                    return CategoryWidget(
                      category: category,
                      onTap: (String id) {
                        print('Product List of Category search id: ' + id);
                        setState(() {
                          widget.categoryClick(id);
                          _searchItemId = id;
                          _isProductListScreen = true;
                        });
                      },
                    );
                  },
                  itemCount:_searchItemId.isEmpty ? _categories.length : 'No Product Found',
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 200 / 220,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
