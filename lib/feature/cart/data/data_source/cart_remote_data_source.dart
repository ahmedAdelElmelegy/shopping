import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_product_result.dart';
import 'package:shopping_app/feature/home/data/models/product_model.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartProductResult> fetchCart();
  Future<void> addToCart(int productId);
  Future<void> removeToCart(int productId);
}

class CartRemoteDataSourceImp extends CartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImp({required this.apiServices});
  @override
  Future<CartProductResult> fetchCart() async {
    final response = await apiServices.get(endPoint: 'carts');
    Set<int> id = {};
    List<ProductEntity> productList = [];
    for (var element in response['data']['cart_items']) {
      productList.add(ProductModel.fromJson(element['product']));
      id.add(element['product']['id']);
    }
    return CartProductResult(product: productList, id: id);
  }

  @override
  Future<void> addToCart(int productId) async {
    final response = await apiServices
        .post(endPoint: 'carts', body: {'product_id': productId});
  }

  @override
  Future<void> removeToCart(int productId) async {
    final response = await apiServices.delete(endPoint: 'carts/$productId');
  }
}
