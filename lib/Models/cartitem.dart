import 'package:toyshop/Models/toymodel.dart';

class CartItem{
  Toy item;
  int qty = 1;

  CartItem({required this.item, required this.qty});
}