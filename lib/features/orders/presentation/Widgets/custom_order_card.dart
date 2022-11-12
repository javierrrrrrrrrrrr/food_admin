import 'package:flutter/material.dart';
import 'package:food_admin/core/constantes/constantes.dart';

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

    final List<String> dropdownValues = [
      "Aceptada",
      "Rechazada",
      "En Camino",
    ];

    String valor = "Aceptada";

    return SizedBox(
      height: size.height * 0.067,
      width: size.width,
      // color: Colors.orange,
      child: cardtype == "A"
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtomOrderCard(
                    color: Colors.white,
                    texto: "LLamar",
                    isborder: true,
                  ),
                  const ButtomOrderCard(
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
            )
          : cardtype == "B"
              ? Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    const Text("Estado: "),
                    Container(
                      height: size.height * 0.04,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(size.height * 0.008),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        onChanged: ((value) {
                          valor = value.toString();
                          print(valor);
                        }),
                        value: valor,
                        items: dropdownValues
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.height * 0.01),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: size.height * 0.018),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                    ),
                    const ButtomOrderCard(
                      isborder: true,
                      color: Colors.white,
                      texto: "Detalles",
                    )
                  ],
                )
              : Container(
                  child: const Text("C"),
                ),
    );
  }
}

class ButtomOrderCard extends StatelessWidget {
  const ButtomOrderCard({
    Key? key,
    required this.texto,
    required this.color,
    this.isborder,
  }) : super(key: key);

  final String texto;
  final Color color;
  final bool? isborder;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.03,
      width: size.width * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.003),
        boxShadow: [
          BoxShadow(
            color: isborder == true
                ? Colors.orange.withOpacity(0.5)
                : Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
        color: color,
        border: isborder == true ? Border.all(color: kprymaricolor) : null,
      ),
      child: Center(
          child: Text(texto,
              style: isborder == true
                  ? const TextStyle(color: kprymaricolor)
                  : const TextStyle(color: Colors.white))),
    );
  }
}

class BodyOrderCard extends StatelessWidget {
  const BodyOrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      width: size.width,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.width * 0.012),
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
