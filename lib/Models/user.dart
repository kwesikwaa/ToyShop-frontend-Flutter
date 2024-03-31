import 'package:toyshop/Models/cartitem.dart';
import 'package:toyshop/Models/transactionshistorymodel.dart';
import 'package:toyshop/Models/wishitem.dart';

class User {
  final String id;
  final List<CartItem> cart;
  final List<WishItem> wishlist;
  final List<TransactionsHistoryModel> history;


  User(this.id, {required this.cart, required this.wishlist, required this.history});}


