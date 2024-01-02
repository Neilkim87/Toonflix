import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final List<Map<String, Object>> arguments;
  final string2IconData = <String, IconData>{
    "Euro": Icons.euro_symbol_rounded,
    "Usd": Icons.attach_money,
    "Bitcoin": Icons.currency_bitcoin,
  };
  /*
  final String name, code, amount;
  final IconData icon;
  */
  final int noOfCard;

  final Color _blackColor = const Color.fromARGB(255, 46, 49, 52);

  CurrencyCard({
    super.key,
    required this.arguments,
    required this.noOfCard,
  });

  @override
  Widget build(BuildContext context) {
    var listOfWidget = <Widget>[];
    for (int i = 0; i < noOfCard; i++) {
      var cont = Transform.translate(
        offset: Offset(0, -20 * i.toDouble()),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: i.isEven == false
                  ? Colors.white
                  : const Color.fromARGB(255, 46, 49, 52),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arguments[i]["name"].toString(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: i.isEven == false ? _blackColor : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          arguments[i]["amount"].toString(),
                          style: TextStyle(
                            color:
                                i.isEven == false ? _blackColor : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          arguments[i]["code"].toString(),
                          style: TextStyle(
                            color: i.isEven == false
                                ? _blackColor
                                : Colors.white.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: const Offset(-5, 12),
                    child: Icon(
                      string2IconData[arguments[i]["name"]],
                      color: i.isEven == false ? _blackColor : Colors.white,
                      size: 88,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

      listOfWidget.add(cont);
    }

    return Column(
      children: listOfWidget,
    );
  }
}
