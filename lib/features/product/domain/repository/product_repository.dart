import 'package:ecoomerce_shop/core/exception/network_exception.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/remote/remote_repositories/product_remote_data_source.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository{
  

  Future<Either<NetworkException,List<Product>?>> getProducts();
}