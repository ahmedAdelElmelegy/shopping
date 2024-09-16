import 'package:shopping_app/feature/settings/domain/entity/favorite_entity.dart';

class FavoriteAllData {
  final List<FavoriteEntity> favorite;
  final Set<num> id;

  FavoriteAllData({required this.favorite, required this.id});
}
