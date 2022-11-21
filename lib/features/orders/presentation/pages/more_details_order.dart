import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';
import 'package:food_admin/features/main_components/widgets/custom_appbar.dart';

import '../Widgets/custom_buttom_order_card.dart';
import '../Widgets/custom_order_card.dart';

class MoreDetailsOrder extends StatelessWidget {
  const MoreDetailsOrder({Key? key, required this.ordertype}) : super(key: key);

  final String ordertype;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(icono: Icons.sort, title: "Detalles"),
      body: Column(
        children: [
          const TopOrderCard(),
          Container(height: size.height * 0.02),
          MoreDetailsBodyInfoUp(),
          Divider(height: size.height * 0.02),
          const ReferenciaField(),
          Divider(height: size.height * 0.005),
          const MoreDetailsBodyResumeDown(),
          OrderDetailsBottom(ordertype: ordertype),
        ],
      ),
    );
  }
}

class ReferenciaField extends StatelessWidget {
  const ReferenciaField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Referencia", style: TextStyle(fontSize: size.height * 0.025)),
          const Text(
              "Al llegar al edificio azul doblar izquierda y seguir recto hasta la calzada"),
        ],
      ),
    );
  }
}

class OrderDetailsBottom extends StatelessWidget {
  const OrderDetailsBottom({
    Key? key,
    required this.ordertype,
  }) : super(key: key);

  final String ordertype;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: ordertype == "A"
          ? const OrderTypeA()
          : ordertype == "B"
              ? const OrderTypeB()
              : const OrderTypeC(),
    );
  }
}

class OrderTypeC extends StatelessWidget {
  const OrderTypeC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Center(
        child: Text(
          "Estado de la orden: Completada",
          style: TextStyle(
              fontSize: size.height * 0.025,
              color: Colors.green,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class OrderTypeB extends StatelessWidget {
  const OrderTypeB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.013),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.05,
          ),
          const Text("Estado: "),
          const customDropDown(),
          SizedBox(
            width: size.width * 0.08,
          ),
          ButtomOrderCard(
            texto: "Cancelar",
            color: Colors.red,
            height: size.height * 0.04,
            width: size.width * 0.35,
          ),
        ],
      ),
    );
  }
}

class OrderTypeA extends StatelessWidget {
  const OrderTypeA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtomOrderCard(
          color: Colors.red,
          texto: "Cancelar",
          height: size.height * 0.04,
          width: size.width * 0.35,
        ),
        ButtomOrderCard(
          color: Colors.green,
          texto: "Aceptar",
          height: size.height * 0.04,
          width: size.width * 0.35,
        ),
      ],
    );
  }
}

class MoreDetailsBodyResumeDown extends StatelessWidget {
  const MoreDetailsBodyResumeDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        children: [
          Divider(height: size.height * 0.001),
          const PriceHead(),
          Divider(height: size.height * 0.001),
          BodyOrderCard(horizontalpadding: size.width * 0.01),
          Divider(height: size.height * 0.005),
          const PriceTotalResume(),
        ],
      ),
    );
  }
}

class PriceTotalResume extends StatelessWidget {
  const PriceTotalResume({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.20,
          color: Colors.blue[50],
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, left: size.width * 0.035),
            child: Column(
              children: [
                const ROwResumen(name: "Subtotal :", price: "\$ 100.00"),
                SizedBox(height: size.height * 0.01),
                const ROwResumen(
                    name: "Comicion entrega(20%) :", price: "\$ 50.00"),
                SizedBox(height: size.height * 0.01),
                const ROwResumen(name: "Impustos(%20) :", price: "\$ 20.00"),
                SizedBox(height: size.height * 0.01),
                const ROwResumen(name: "Descuentos(10%) :", price: "\$ 20.00"),
                Divider(
                  height: size.height * 0.02,
                  color: Colors.black,
                ),
                const ROwResumen(name: "Total :", price: "\$ 190.00"),
              ],
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.8,
          bottom: size.height * 0.032,
          child: const ButtomOrderCard(
            color: Colors.white,
            isborder: true,
            texto: "Imprimir",
          ),
        ),
      ],
    );
  }
}

class ROwResumen extends StatelessWidget {
  const ROwResumen({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
            //color: Colors.blue,
            width: size.width * 0.5,
            child: Text(name, style: const TextStyle())),
        Text(price, style: const TextStyle()),
      ],
    );
  }
}

class PriceHead extends StatelessWidget {
  const PriceHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue[50],
      height: size.height * 0.04,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: size.width * 0.01),
            const Text("Productos"),
            SizedBox(width: size.width * 0.32),
            const Text("Cantidad"),
            SizedBox(width: size.width * 0.2),
            const Text("Precio"),
          ],
        ),
      ),
    );
  }
}

class MoreDetailsBodyInfoUp extends StatelessWidget {
  MoreDetailsBodyInfoUp({
    Key? key,
  }) : super(key: key);

  List<List<dynamic>> prueba = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    prueba.add([Icons.phone, "+53 52538905", "LLamar"]);
    prueba.add([Icons.mail, "javierserrano98050602@gmail.com", "email"]);
    prueba.add([
      Icons.location_on_outlined,
      "Calle Eusebio GOnzlez entre Pepe Portilla y Orotava ",
      "ir"
    ]);
    return SizedBox(
      //color: Colors.blue,
      height: size.height * 0.2,
      child: Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InfoRow(
              icono: prueba[index][0],
              texto: prueba[index][1],
              buttomTexto: prueba[index][2],
            );
          },
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            final size = MediaQuery.of(context).size;
            return Divider(
              height: size.height * 0.04,
            );
          },
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.icono,
    required this.texto,
    required this.buttomTexto,
    this.onPressed,
  }) : super(key: key);

  final IconData icono;
  final String texto;
  final String buttomTexto;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.05,
        ),
        Icon(
          icono,
          color: kprymaricolor,
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        SizedBox(
          width: size.width * 0.6,
          child: Text(texto),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        ButtomOrderCard(
          onPressed: onPressed,
          color: Colors.white,
          texto: buttomTexto,
          isborder: true,
        ),
      ],
    );
  }
}
