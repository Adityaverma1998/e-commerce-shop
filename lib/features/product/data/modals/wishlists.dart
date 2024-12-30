class Wishlists{
  final int? id; // Primary key in the database
  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;

  Wishlists({this.id,required this.productId,required this.productImage,required this.productName,required this.productPrice});

  factory Wishlists.fromJson(Map<String,dynamic> json){
    return Wishlists(
       productId: json['id'], 
      productImage: json['image'], 
      productName: json['title'],
       productPrice: json['price']);
  }

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'id': productId,
      'image': productName,
      'title': productPrice,
      'price': productImage,
    };
  }



}