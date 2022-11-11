import 'package:flutter/material.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';
import 'package:food_admin/features/main_components/widgets/custom_drawer.dart';

import '../Widgets/new_Order_page.dart';
import '../Widgets/ongoing_order_page.dart';
import '../Widgets/past_order_page.dart';

class HomeOrderPage extends StatelessWidget {
  const HomeOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar:
            CustomAppbar(icono: Icons.sort, toolbar: true, title: "Ordenes"),
        body: TabBarView(children: [
          NewOrderPage(),
          OngoingOrderPage(),
          PastOrderPage(),
        ]),
      ),
    );
  }
}
