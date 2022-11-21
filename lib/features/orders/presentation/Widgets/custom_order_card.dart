import 'package:flutter/material.dart';

import '../pages/more_details_order.dart';
import 'custom_buttom_order_card.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.cardType}) : super(key: key);

  final String cardType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.015),
      height: size.height * 0.3,
      width: size.width * 0.95,
      //bordes
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.15)),
        color: Colors.white,
      ),
      // color: Colors.red,
      child: Column(
        children: [
          const TopOrderCard(),
          const BodyOrderCard(),
          const Line(),
          BottomOrderCard(cardtype: cardType),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.0005,
      width: size.width,
      color: Colors.black.withOpacity(0.5),
    );
  }
}

class BottomOrderCard extends StatelessWidget {
  const BottomOrderCard({
    Key? key,
    required this.cardtype,
  }) : super(key: key);

  final String cardtype;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.067,
      width: size.width,
      // color: Colors.orange,
      child: cardtype == "A"
          ? const StatusAWidget()
          : cardtype == "B"
              ? const StatusBWidget()
              : const StatusCWidget(),
    );
  }
}

class StatusCWidget extends StatelessWidget {
  const StatusCWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.05,
        ),
        const Text("Estado: Orden Entregada"),
        SizedBox(
          width: size.width * 0.25,
        ),
        ButtomOrderCard(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MoreDetailsOrder(
                          ordertype: "C",
                        )));
          },
          color: Colors.white,
          texto: 'Detalles',
          isborder: true,
        ),
      ],
    );
  }
}

class StatusBWidget extends StatelessWidget {
  const StatusBWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.03,
        ),
        const Text("Estado: "),
        const customDropDown(),
        SizedBox(
          width: size.width * 0.25,
        ),
        ButtomOrderCard(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MoreDetailsOrder(
                          ordertype: 'B',
                        )));
          },
          isborder: true,
          color: Colors.white,
          texto: "Detalles",
        )
      ],
    );
  }
}

class customDropDown extends StatelessWidget {
  const customDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownValues = [
      "Aceptada",
      "Rechazada",
      "En Camino",
    ];

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.height * 0.008),
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 0.80),
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        onChanged: ((value) {}),
        value: "Aceptada",
        items: dropdownValues
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.height * 0.01),
                    child: Text(
                      value,
                      style: TextStyle(fontSize: size.height * 0.018),
                    ),
                  ),
                ))
            .toList(),
      )),
    );
  }
}

class StatusAWidget extends StatelessWidget {
  const StatusAWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ButtomOrderCard(
            color: Colors.white,
            texto: "LLamar",
            isborder: true,
          ),
          ButtomOrderCard(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoreDetailsOrder(
                            ordertype: "A",
                          )));
            },
            color: Colors.white,
            texto: "Detalles",
            isborder: true,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          const ButtomOrderCard(
            color: Colors.red,
            texto: "Cancelar",
            isborder: false,
          ),
          const ButtomOrderCard(
            color: Colors.green,
            texto: "Aceptar",
            isborder: false,
          ),
        ],
      ),
    );
  }
}

class BodyOrderCard extends StatelessWidget {
  const BodyOrderCard({
    Key? key,
    this.horizontalpadding,
  }) : super(key: key);

  final double? horizontalpadding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalpadding ?? 0),
      child: SizedBox(
        height: size.height * 0.15,
        width: size.width,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.width * 0.012),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Helado de fresa"),
                    Text("Cant: 2"),
                    Text("\$120"),
                  ],
                ),
              );
            }),
        //    color: Colors.green,
      ),
    );
  }
}

class TopOrderCard extends StatelessWidget {
  const TopOrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue[50],
      height: size.height * 0.08,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          children: [
            Icon(
              Icons.credit_score_outlined,
              size: size.height * 0.05,
              color: Colors.green,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Javier Diaz",
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                Text(
                  "Hoy a las 12:00",
                  style: TextStyle(fontSize: size.height * 0.015),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order id:2456",
                  style: TextStyle(fontSize: size.height * 0.018),
                ),
                Text(
                  "Total:\$106.23",
                  style: TextStyle(fontSize: size.height * 0.018),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
