// ignore_for_file: non_constant_identifier_names, camel_case_types

class CatalogModel {
  static final AllProducts = [
    item(
      productName: 'iPhone 13 Pro',
      productPrice: '\$999',
      productDis:
          'The iPhone 13 Pro is the latest model from Apple with advanced features.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Samsung Galaxy S21',
      productPrice: '\$899',
      productDis:
          'The Samsung Galaxy S21 boasts a high-resolution display and powerful camera.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Google Pixel 6',
      productPrice: '\$799',
      productDis:
          'The Google Pixel 6 offers a pure Android experience and excellent camera quality.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'OnePlus 9 Pro',
      productPrice: '\$899',
      productDis:
          'The OnePlus 9 Pro is known for its fast charging and smooth performance.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Xiaomi Mi 11',
      productPrice: '\$699',
      productDis:
          'The Xiaomi Mi 11 features a beautiful AMOLED display and a competitive price.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Sony Xperia 1 III',
      productPrice: '\$1099',
      productDis:
          'The Sony Xperia 1 III is a flagship with a focus on multimedia and photography.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'LG Velvet',
      productPrice: '\$599',
      productDis:
          'The LG Velvet offers a unique design and a good balance of features.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Huawei P40 Pro',
      productPrice: '\$799',
      productDis:
          'The Huawei P40 Pro has a versatile camera system and a powerful chipset.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'Motorola Moto G Power',
      productPrice: '\$249',
      productDis:
          'The Moto G Power is known for its long-lasting battery life and affordability.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      productName: 'ASUS ROG Phone 5',
      productPrice: '\$999',
      productDis:
          'The ASUS ROG Phone 5 is a gaming-oriented smartphone with high-end specs.',
      proImage: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
  ];
}

class item {
  final String productName;
  final String productPrice;
  final String productDis;
  final String proImage;

  item({
    required this.productName,
    required this.productPrice,
    required this.productDis,
    required this.proImage,
  });

  factory item.fromJson(Map<String, dynamic> map) {
    return item(
      productName: map['ProductName'],
      productPrice: map['ProductPrice'],
      productDis: map['ProductDis'], // Corrected the casing here
      proImage: map['ProImage'], // Corrected the casing here
    );
  }
}
