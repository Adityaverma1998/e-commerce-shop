import 'package:dio/dio.dart';
import 'package:ecoomerce_shop/core/exception/network_exception.dart';
import 'package:ecoomerce_shop/features/product/data/dataSources/remote/remote_repositories/product_remote_data_source.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository{
   final ProductRemoteDataSource  _productRemoteDataSource; 

   ProductRepositoryImpl(this._productRemoteDataSource);


  @override
  Future<Either<NetworkException,List<Product>?>> getProducts() async{
    try{
      final result = await _productRemoteDataSource.getproducts();
      print("data on product repository $result");
      return Right(result);
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
    

  }
  
}