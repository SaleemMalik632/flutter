// ignore_for_file: non_constant_identifier_names, camel_case_types

class item {
  final String ProductName;
  final String ProductPrice;
  final String ProdcictDis;
  final String ProImage;

  item(this.ProductName, this.ProductPrice, this.ProdcictDis, this.ProImage);
}

final AllProducts = [
  item('ProductName1', 'ProductPrice1', 'ProdcictDis1', 'ProImage1'),
  item('ProductName2', 'ProductPrice2', 'ProdcictDis2', 'ProImage2'),
  item('ProductName3', 'ProductPrice3', 'ProdcictDis3', 'ProImage3'),
  item('ProductName4', 'ProductPrice4', 'ProdcictDis4', 'ProImage4'),
];
