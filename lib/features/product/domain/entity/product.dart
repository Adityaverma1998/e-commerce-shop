
class Product{
  final int id;
  final String title;
  final  dynamic price;
  final String description;
  final String category;
  final String image;

 Product({required this.id,required this.title,required this.category,required this.description,required this.image,required this.price});
  
      // Convert JSON to Model

  factory Product.fromJson(Map<String,dynamic> json){
  //  print("id type: ${json['id'].runtimeType}");
  // print("title type: ${json['title'].runtimeType}");
  // print("price type: ${json['price'].runtimeType}");
  // print("description type: ${json['description'].runtimeType}");
  // print("category type: ${json['category'].runtimeType}");
  // print("image type: ${json['image'].runtimeType}");


    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image']);
  }

   // Convert Model to JSON
    Map<String,dynamic> toJson(){
       return{
        'id':id,
        'title':title,
        'price':price,
        'category':category,
        'description':description,
        'image':image
      };
    }

}

// {
//     "id": 1,
//     "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//     "price": 109.95,
//     "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//     "category": "men's clothing",
//     "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//     "rating": {
//       "rate": 3.9,
//       "count": 120
//     }