import 'package:greengrocer/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int qtd;

  CartItemModel({
    required this.item,
    required this.qtd,
  });


  double totalPrice(){
    return item.price * qtd;
  }
}
