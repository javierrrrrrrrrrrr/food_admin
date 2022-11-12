import 'package:flutter/material.dart';

import '../custom_order_card.dart';

class PastOrderPage extends StatelessWidget {
  const PastOrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            OrderCard(cardType: "C"),
            OrderCard(cardType: "C"),
            OrderCard(cardType: "C"),
            OrderCard(cardType: "C"),
          ],
        ),
      ),
    );
  }
}
