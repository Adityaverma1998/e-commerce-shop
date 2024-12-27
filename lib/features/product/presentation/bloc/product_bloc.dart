import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_product_details_usecase.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.getProductUsecase,required this.getProductDetailsUsecase})
      : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductDetails>(_onFetchProductDetails);
  }

  final GetProductUsecase getProductUsecase;
  final GetProductDetailsUsecase getProductDetailsUsecase;
  Future<void> _onFetchProducts(
    FetchProducts event, Emitter<ProductState> emit) async {
  try {
    emit(ProductLoading());

    final result = await getProductUsecase.getProducts();
       print('check resut are ${result}');
    result.fold(
      (failure) {
        // Handle failure case
        emit(ProductError(message: failure.toString()));
      },
      (products) {
        // Handle success case
        emit(ProductLoaded(products: products ?? []));
      },
    );
  } catch (error) {
    emit(ProductError(message: error.toString()));
  }
}

  Future<void> _onFetchProductDetails(FetchProductDetails event, Emitter<ProductState> emit) async {
  try {
    emit(ProductLoading());

    // Fetch product details by passing the event's product ID
    final result = await getProductDetailsUsecase.getProductDetails(event.productId);

    print('check result: $result');

    result.fold(
      (failure) {
        // Handle failure case
        emit(ProductError(message: failure.toString()));
      },
      (product) {
        // Handle success case, with a fallback for null products
        if (product != null) {
          emit(ProductDetailLoaded(productDetails: product));
        } else {
          emit(const ProductError(message: 'Product not found.'));
        }
      },
    );
  } catch (error) {
    // Handle any unexpected errors
    emit(ProductError(message: error.toString()));
  }
}


}
