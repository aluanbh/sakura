import 'dart:convert';

import 'package:sakura/src/models/product_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class ProductModel extends Model {
  List<Product> _products = [];

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    _products.add(product);
  }

  void fetchProducts() {
    http
        .get(
            "http://192.168.0.7/flutter_product_app/api/products/getProducts.php")
        .then((http.Response response) {
      //print("Fecthing data: ${response.body}");
      final List fetchedData = json.decode(response.body);
      final List<Product> fetchedProductItems = [];
      //print(fetchedData);
      fetchedData.forEach((data) {
        Product product = Product(
          id: data["id"],
          category: data["category"],
          discount: double.parse(data["discount"]),
          imagePath: data["imagePath"],
          name: data["name"],
          price: double.parse(data["price"]),
        );

        fetchedProductItems.add(product);
      });

      _products = fetchedProductItems;
      print(_products);
    });
  }
}
