import 'package:flutter/material.dart';
import 'package:food_admin/features/categories/presentation/pages/home_categories_page.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';

import '../../orders/presentation/pages/home_orders_page.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/option_menu_container.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppbar(
        icono: Icons.sort,
        //  title: "Panel de Control",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              " Panel de Control ",
              style: TextStyle(fontSize: size.height * 0.05),
            ),
            Text(
              "Seleccione una Opción",
              style: TextStyle(fontSize: size.height * 0.03),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Row(
              children: [
                const OptionMenuContainer(
                  name: "Productos",
                  bigicon: Icons.production_quantity_limits,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                OptionMenuContainer(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeCategoriesPage()));
                  },
                  name: "Categorias",
                  bigicon: Icons.auto_awesome_motion_outlined,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              children: [
                OptionMenuContainer(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeOrderPage()));
                  },
                  name: "Ordenes",
                  bigicon: Icons.grading_outlined,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                const OptionMenuContainer(
                  name: "Reportes",
                  bigicon: Icons.receipt_long_outlined,
                  color: Colors.orange,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
