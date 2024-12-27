import 'package:ecoomerce_shop/core/exception/network_exception.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductDetailsUsecase  {
  final ProductRepository _repository;

  GetProductDetailsUsecase(this._repository);
     Future<Either<NetworkException,Product?>> getProductDetails(int id) async{

    return  await _repository.getProductDetails(id);
  }
}