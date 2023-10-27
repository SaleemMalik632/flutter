class Product {
  final String name;
  final String price;
  final String desc;
  // make the json data maping for the product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['price'],
      json['description'],
    );
  }
  Product(this.name, this.price, this.desc);
  
}
