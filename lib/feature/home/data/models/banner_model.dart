import 'package:shopping_app/feature/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  final int id;
  final String image;
   dynamic category;
   dynamic product;

  BannerModel(
      {required this.id,
      required this.image,
       this.category,
       this.product})
      : super(bannerId: id, bannerImage: image);

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] as int,
        image: json['image'] as String? ??'',
        category: json['category']  ,
        product: json['product'] ,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category': category,
        'product': product,
      };
}
