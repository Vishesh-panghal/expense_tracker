import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String Label;
  final double SpendingAmount;
  final double SpendingPercentageOfTotal;

  ChartBar(this.Label, this.SpendingAmount, this.SpendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: <Widget>[
            Container(
                height: constrains.maxHeight * 0.1,
                child: FittedBox(
                    child:
                        Text('\u{20B9}${SpendingAmount.toStringAsFixed(0)}'))),
            SizedBox(height: 15),
            Container(
              height: constrains.maxHeight * 0.6,
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
              height: constrains.maxHeight * .1,
            ),
            Container(
                height: constrains.maxHeight * .1,
                child: FittedBox(child: Text(Label))),
          ],
        );
      },
    );
  }
}
