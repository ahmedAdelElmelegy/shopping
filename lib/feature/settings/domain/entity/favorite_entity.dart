class FavoriteEntity {
  final num delId;
  final String productImage;
  final num productId;
  final num productPrice;
  final String productName;
  final String productDesc;

  FavoriteEntity(
      {required this.productImage,
      required this.delId,
      required this.productId,
      required this.productPrice,
      required this.productName,
      required this.productDesc});
}
