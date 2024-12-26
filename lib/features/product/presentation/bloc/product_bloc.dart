import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.getProductUsecase})
      : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  final GetProductUsecase getProductUsecase;

  Future<void> _onFetchProducts(
    FetchProducts event, Emitter<ProductState> emit) async {
  try {
    emit(ProductLoading());

    final result = await getProductUsecase.getProducts();

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

}
