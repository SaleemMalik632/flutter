// ignore_for_file: non_constant_identifier_names, camel_case_types

class CatalogModel {
  static final AllProducts = [
    item(
      'iPhone 13 Pro',
      '\$999',
      'The iPhone 13 Pro is the latest model from Apple with advanced features.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Samsung Galaxy S21',
      '\$899',
      'The Samsung Galaxy S21 boasts a high-resolution display and powerful camera.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Google Pixel 6',
      '\$799',
      'The Google Pixel 6 offers a pure Android experience and excellent camera quality.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'OnePlus 9 Pro',
      '\$899',
      'The OnePlus 9 Pro is known for its fast charging and smooth performance.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Xiaomi Mi 11',
      '\$699',
      'The Xiaomi Mi 11 features a beautiful AMOLED display and a competitive price.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Sony Xperia 1 III',
      '\$1099',
      'The Sony Xperia 1 III is a flagship with a focus on multimedia and photography.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'LG Velvet',
      '\$599',
      'The LG Velvet offers a unique design and a good balance of features.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Huawei P40 Pro',
      '\$799',
      'The Huawei P40 Pro has a versatile camera system and a powerful chipset.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'Motorola Moto G Power',
      '\$249',
      'The Moto G Power is known for its long-lasting battery life and affordability.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
    item(
      'ASUS ROG Phone 5',
      '\$999',
      'The ASUS ROG Phone 5 is a gaming-oriented smartphone with high-end specs.',
      'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg',
    ),
  ];
}

class item {
  
  final String ProductName;
  final String ProductPrice;
  final String ProdcictDis;
  final String ProImage;

  item(this.ProductName, this.ProductPrice, this.ProdcictDis, this.ProImage);
}
