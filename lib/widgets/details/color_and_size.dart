import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../screens/product_details_screen.dart';
import '../../util/shopping_colors.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: shrineGreen300, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: kDefaultPadding),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: shrineGreen300),
                      children: [
                        TextSpan(text: "Price\n"),
                        TextSpan(
                          text: product.price.toString() + " ₹",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: kTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: shrineGreen300),
                  children: [
                    TextSpan(text: "Size\n"),
                    TextSpan(text:
                          "${product.title.substring(product.title.indexOf('/')
                              + 1, product.title.length)}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: kTextColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
