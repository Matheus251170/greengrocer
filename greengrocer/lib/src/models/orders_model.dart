import 'cart_item_model.dart';

class OrderModel {

  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel(this.id, this.createdDateTime, this.overdueDateTime,
      this.items, this.status, this.copyAndPaste, this.total);

}