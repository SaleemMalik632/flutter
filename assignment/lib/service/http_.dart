import 'dart:convert';
import 'package:http/http.dart' as http;
import '../class/Product.dart';

class HttpService {
  static postProduct(Map pdata) async {
    final uri = Uri.parse('http://localhost:3000/api/prodect');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(pdata);
    final encoding = Encoding.getByName('utf-8');
    try {
      final res = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      if (res.statusCode == 201) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    } 
  }

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse("http://localhost:3000/api/all"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
