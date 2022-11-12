import 'package:flutter/material.dart';

import '../custom_order_card.dart';

class OngoingOrderPage extends StatelessWidget {
  const OngoingOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            OrderCard(cardType: "B"),
            OrderCard(cardType: "B"),
            OrderCard(cardType: "B"),
            OrderCard(cardType: "B"),
          ],
        ),
      ),
    );
  }
}
