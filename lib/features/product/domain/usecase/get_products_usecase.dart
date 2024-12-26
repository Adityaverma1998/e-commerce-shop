import 'package:ecoomerce_shop/core/domain/usecase.dart';
import 'package:ecoomerce_shop/core/exception/network_exception.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductUsecase  {
  final ProductRepository _repository;

  GetProductUsecase(this._repository);
  Future<Either<NetworkException,List<Product>?>> getProducts() async{

    return  await _repository.getProducts();
  }
}