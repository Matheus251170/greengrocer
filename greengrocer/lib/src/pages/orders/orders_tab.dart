import 'package:flutter/material.dart';

import 'package:greengrocer/src/pages/auth/config/app_data.dart' as appData;
import 'package:greengrocer/src/pages/orders/Order_Tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => OrderTile(
          orderModel: appData.orders[index],
        ),
        separatorBuilder: (_, index) => const SizedBox(
          height: 10,
        ),
        itemCount: appData.orders.length,
      ),
    );
  }
}
