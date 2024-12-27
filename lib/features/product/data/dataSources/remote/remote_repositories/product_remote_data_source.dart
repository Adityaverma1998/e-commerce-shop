import 'package:ecoomerce_shop/core/constant/enspoints.dart';
import 'package:ecoomerce_shop/core/network_client/dio_client.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';

class ProductRemoteDataSource {
  final DioClient _dioClient;

  ProductRemoteDataSource(this._dioClient);

  Future<List<Product>?> getProducts() async {
    try {
      final response = await _dioClient.get(Endpoints.products);

      // Ensure response.data is a List
      if (response.data is List) {
        print("Check response data: ${response.data}");

        // Map the response data to a list of Product objects
        List<Product> products = (response.data as List)
            .map((productData) {
              print("Mapping product data: $productData");

              // Create a product from the JSON data
              final product = Product.fromJson(productData);

              // If the product is null, log an error (though Product.fromJson should return a valid object)
              if (product == null) {
                print("Error: Product is null for data: $productData");
              }
              return product;
            })
            .toList();

        // Return the mapped list of products
        return products;
      } else {
        // Handle the case where response.data is not a List
        print("Error: Response data is not a List. Data: ${response.data}");
        return null;
      }
    } catch (e) {
      print("Error fetching products: $e");
      rethrow;
    }
  }

  Future<Product?> getProductDetails(int productId) async {
    try {
      final response = await _dioClient.get('${Endpoints.products}/$productId');

      print("check product details response are ${response}");

      if (response.data != null) {
        Product product = Product.fromJson(response.data);
        return product;
      } else {
        print("Error: Product details not found for productId: $productId");
        return null;
      }
    } catch (e) {
      print("Error fetching product details: $e");
      rethrow;
    }
  }
}
