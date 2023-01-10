import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
    itemName: 'Maçã',
    description: 'Maçã top, Maçã doce, Maçã gostosa',
    imgUrl: 'assets/fruits/apple.png',
    price: 5.5,
    unit: 'kg');

ItemModel grape = ItemModel(
    itemName: 'Uva',
    description: 'Uva top, Uva doce, Uva gostosa',
    imgUrl: 'assets/fruits/grape.png',
    price: 1.5,
    unit: 'kg');

ItemModel guava = ItemModel(
    itemName: 'Goiaba',
    description: 'Goiaba top, Goiaba doce, Goiaba gostosa',
    imgUrl: 'assets/fruits/guava.png',
    price: 7.5,
    unit: 'kg');

ItemModel kiwi = ItemModel(
    itemName: 'Kiwi',
    description: 'Kiwi top, Kiwi doce, Kiwi gostosa',
    imgUrl: 'assets/fruits/kiwi.png',
    price: 3.5,
    unit: 'uni');

ItemModel mango = ItemModel(
    itemName: 'Manga',
    description: 'Manga top, Manga doce, Manga gostosa',
    imgUrl: 'assets/fruits/mango.png',
    price: 7.5,
    unit: 'kg');

ItemModel papaya = ItemModel(
    itemName: 'Papaya',
    description: 'Papaya top, Papaya doce, Papaya gostosa',
    imgUrl: 'assets/fruits/papaya.png',
    price: 4.5,
    unit: 'kg');

List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];

List<String> listCategories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Cereais',
  'Temperos',
];

List<CartItemModel> listCart = [
  CartItemModel(item: apple, qtd: 2),
  CartItemModel(item: mango, qtd: 1),
  CartItemModel(item: grape, qtd: 1),
];

UserModel user = UserModel(
    name: 'Matheus',
    email: 'matheus251170@gmail.com',
    phone: '(11)96614-8844',
    cpf: '526.337.188-84',
    passwod: '', id: '', token: '');

List<OrderModel> orders = [
  OrderModel(
      "sd651w234wdas",
      DateTime.parse('2022-11-11 10:00:10.456'),
      DateTime.parse('2022-25-11 12:00:10.456'),
      [CartItemModel(item: apple, qtd: 2), CartItemModel(item: mango, qtd: 3)],
      "preparing_purchase",
      "54rsd2f1sr5g",
      11),

  OrderModel(
      "sd651w234wdas",
      DateTime.parse('2022-11-11 10:00:10.456'),
      DateTime.parse('2022-25-11 12:00:10.456'),
      [CartItemModel(item: apple, qtd: 2), CartItemModel(item: mango, qtd: 3)],
      "pending_payment",
      "54rsd2f1sr5g",
      11),

  OrderModel(
      "as4d65a4sd645",
      DateTime.parse('2022-16-11 13:00:10.456'),
      DateTime.parse('2022-25-11 15:00:10.456'),
      [CartItemModel(item: papaya, qtd: 9), CartItemModel(item: grape, qtd: 6)],
      "delivered",
      "6a5s4d56as",
      23),
];
