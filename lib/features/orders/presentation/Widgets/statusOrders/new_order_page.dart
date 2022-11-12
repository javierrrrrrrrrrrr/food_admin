import 'package:flutter/material.dart';

import '../custom_order_card.dart';

class NewOrderPage extends StatelessWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            OrderCard(cardType: "A"),
            OrderCard(cardType: "A"),
            OrderCard(cardType: "A"),
            OrderCard(cardType: "A"),
          ],
        ),
      ),
    );
  }
}
