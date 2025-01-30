import 'package:shopping_app/core/utils/api_services.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_product_result.dart';
import 'package:shopping_app/feature/cart/domain/entites/cart_update.dart';
import 'package:shopping_app/feature/home/data/models/product_model.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartProductResult> fetchCart();
  Future<void> addToCart(int productId);
  Future<void> removeToCart(int productId);
  Future<void> updateCartQuantity(CartUpdateModel cartUpdateModel);
}

class CartRemoteDataSourceImp extends CartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImp({required this.apiServices});
  @override
  Future<CartProductResult> fetchCart() async {
    final response = await apiServices.get(endPoint: 'carts');
    Set<int> id = {};
    int totalPrice;
    List<int> cart_id = [];
    List<int> quantity = [];
    List<ProductEntity> productList = [];
    for (var element in response['data']['cart_items']) {
      cart_id.add(element['id']);

      productList.add(ProductModel.fromJson(element['product']));
      quantity.add(element['quantity']);
      id.add(element['product']['id']);
    }
    totalPrice = response['data']['total'];
    return CartProductResult(
        quantity: quantity,
        cart_id: cart_id,
        totalPrice,
        product: productList,
        id: id);
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

  @override
  Future<void> updateCartQuantity(CartUpdateModel cartUpdateModel) async {
    final response = await apiServices.put(
        endPoint: 'carts/${cartUpdateModel.cartId}',
        body: {'quantity': cartUpdateModel.quantity});
  }
}
