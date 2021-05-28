import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final spendigamount;
  final double spendingpercentage;

  const ChartBar(this.label, this.spendigamount, this.spendingpercentage);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
            child: FittedBox(
                child: Text(spendigamount.toStringAsFixed(0) + " Rs"))),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingpercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
