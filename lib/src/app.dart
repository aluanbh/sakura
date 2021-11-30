import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sakura/src/models/product_model.dart';
import 'package:sakura/src/scoped-model/product_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget {
  final ProductModel productModel = ProductModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
      model: productModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sakura Delivery App",
        theme: ThemeData(primaryColor: Colors.pinkAccent),
        home: MainScreen(productModel: productModel),
      ),
    );
  }
}
