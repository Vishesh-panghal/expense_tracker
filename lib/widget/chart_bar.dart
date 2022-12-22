import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String Label;
  final double SpendingAmount;
  final double SpendingPercentageOfTotal;

  ChartBar(this.Label, this.SpendingAmount, this.SpendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\u{20B9}${SpendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: 15),
        Container(
          height: 80,
          width: 15,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: SpendingPercentageOfTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Text(Label),
      ],
    );
  }
}
