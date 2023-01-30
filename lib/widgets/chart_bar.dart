import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label; //曜日ラベル
  final double spendingAmount; //支出額
  final double spendingPctOfTotal; //合計に対する支出割合

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ), //toStringAsFixed(0)で小数点以下を全て0にする
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          // 要素を部分的に色を塗りたい。重なり合うstack widgetを使う
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Container全てを覆うわけではないのでspendingPctOfTotalの高さ分だけのSizedBoxを利用する
              FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
