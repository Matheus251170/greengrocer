import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/pages/orders/order_status_widget.dart';
import 'package:greengrocer/src/pages/widgets/Payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderModel;

  final UtilsServices util = UtilsServices();

  OrderTile({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: orderModel.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //pedido
              Text(
                'Pedido: ${orderModel.id}',
              ),

              Text(
                util.formatDateTime(orderModel.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: orderModel.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: util,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  // Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: orderModel.status,
                      isOverdue: orderModel.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),

            //total geral
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: util.priceToCurrency(orderModel.total),
                  ),
                ],
              ),
            ),

            //botão pagamento
            Visibility(
              visible: orderModel.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                onPressed: () {
                  showDialog(context: context, builder: (_) => PaymentDialog(orderModel: orderModel,),);
                },
                icon: const Icon(Icons.pix, size: 18),
                label: const Text('Ver QR Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _OrderItemWidget extends StatelessWidget {
//   const _OrderItemWidget({
//     Key? key,
//     required this.orderModel,
//     required this.util,
//   }) : super(key: key);
//
//   final OrderModel orderModel;
//   final UtilsServices util;
//
//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: Row(
//         children: [
//           //lista pedidos
//           Expanded(
//             flex: 3,
//             child: SizedBox(
//               height: 150,
//               child: ListView(
//                 children: orderModel.items.map((item) {
//                   return Row(
//                     children: [
//                       Text(
//                         '${item.qtd} ${item.item.unit} ',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(item.item.itemName),
//                       ),
//                       Text(
//                         util.priceToCurrency(
//                           item.totalPrice(),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//
//           //divisao
//           VerticalDivider(
//             color: Colors.grey.shade300,
//             thickness: 2,
//             width: 8,
//           ),
//
//           //status pedido
//           Expanded(
//             flex: 2,
//             child: OrderStatusWidget(
//               status: orderModel.status,
//               isOverdue: orderModel.overdueDateTime.isBefore(
//                 DateTime.now(),
//               ),
//             ),
//           ),
//
//           //Total
//
//           //Total
//           Text.rich(
//             TextSpan(
//               style: const TextStyle(
//                 fontSize: 20,
//               ),
//               children: [
//                 const TextSpan(
//                   text: 'Total ',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextSpan(
//                   text: util.priceToCurrency(orderModel.total),
//                 ),
//               ],
//             ),
//           ),
//
//           //botão pagamento
//
//           Visibility(
//             visible: orderModel.status == 'pending_payment',
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               onPressed: () {
//               },
//               icon: Icon(Icons.pix),
//               label: const Text('Ver QR Code Pix'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.qtd} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}