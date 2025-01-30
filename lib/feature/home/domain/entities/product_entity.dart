class ProductEntity {
  final num productId;
  final String productName;
  final String productImage;
  final String productDescription;
  final num productPrice;
  final num productOldPrice;
  final List<dynamic> productsmImage;

  ProductEntity(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.productPrice,
      required this.productsmImage,
      required this.productOldPrice});
}
