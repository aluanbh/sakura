import 'package:flutter/material.dart';
import 'package:sakura/src/data/product_data.dart';
import 'widgets/home_top_info.dart';
import 'widgets/product_category.dart';
import 'widgets/search_field.dart';
import 'widgets/bought_products.dart';

//Data
import 'data/product_data.dart';
import 'models/product_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          ProductCategory(),
          SizedBox(height: 20.0),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Comprados com frequência",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text("Ver todos",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[200])),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: _products.map(_buildProductItems).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItems(Product product) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtProducts(
        id: product.id,
        name: product.name,
        imagePath: product.imagePath,
        category: product.category,
        discount: product.discount,
        price: product.price,
        ratings: product.ratings,
      ),
    );
  }
}
