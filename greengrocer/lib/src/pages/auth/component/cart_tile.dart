import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/auth/config/app_data.dart';
import 'package:greengrocer/src/pages/auth/config/custom_colors.dart';
import 'package:greengrocer/src/pages/widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  const CartTile({Key? key, required this.cartItem, required this.remove}) : super(key: key);

  final CartItemModel cartItem;

  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utils = UtilsServices();


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),

      child: ListTile(
        //img
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        //total
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),

        //qtd
        trailing: QuantityWidget(
          sufix: widget.cartItem.item.unit,
          value: widget.cartItem.qtd,
          result: (qtd) {
            setState(() {
              widget.cartItem.qtd = qtd;

              if(qtd == 0){
                //remover item
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
