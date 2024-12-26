import 'package:ecoomerce_shop/core/constant/enspoints.dart';
import 'package:ecoomerce_shop/core/network_client/dio_client.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';

class ProductRemoteDataSource {
  final DioClient _dioClient;

ProductRemoteDataSource( this._dioClient);

 Future<List<Product>?> getproducts() async {
    try {
      final response = await _dioClient.get(Endpoints.products);
      if (response.data is List) {
        return (response.data as List)
            .map((productData) => Product.fromJson(productData))
            .toList();
      }
    } catch (_) {
      rethrow;
    }
  }
  

}