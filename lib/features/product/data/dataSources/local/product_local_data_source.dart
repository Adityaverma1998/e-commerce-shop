import 'package:ecoomerce_shop/core/constant/strings.dart';
import 'package:ecoomerce_shop/core/db/db_helper.dart';
import 'package:ecoomerce_shop/features/product/domain/usecase/add_wishlist_usecase.dart';

class ProductLocalDataSource {
  final DBHelper dbHelper;

  ProductLocalDataSource({required this.dbHelper});

  static const _tblWishlist = Strings.wishlists;

  Future<String> addToWishlist(AddWishlistParams product) async {
    final db = await dbHelper.openDatabaseConnection();

    return db.insert(_tblWishlist, product.toJson()).toString();
  }

  Future<List<Map<String, dynamic>>> getWishlist() async {
    final db = await dbHelper.openDatabaseConnection();
    return db.query(_tblWishlist);
  }

  Future<int> removeFromWishlist(String productId) async {
    final db = await dbHelper.openDatabaseConnection();
    return db.delete(
      _tblWishlist,
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
}
