import 'package:ecoomerce_shop/core/di/service_locator.dart';
import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:ecoomerce_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductBloc _productBloc = getIt<ProductBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productBloc.add(FetchProductDetails(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details "),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if(state is ProductLoading){
             return const Center(child: CircularProgressIndicator());
          }else if(state is ProductDetailLoaded){
            return _buildProductDetailScreen(context,state.productDetails);
          }else{
             return const Center(
                child: Text('No products available.'),
              );
          }
          
           
        }
      ),
    );
  }


   Widget _buildProductDetailScreen(BuildContext context,Product product){
    return Column(
            children: <Widget>[
              Container(
                height:300,
                width: double.infinity,
                child: Image.network(product.image),),

               Expanded(child: Text(product.title)),
               Expanded(child: Text(product.title)),
            ],
          );
   }
}
