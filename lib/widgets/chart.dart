import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  // recentTransactionsを格納するコンストラクタ
  Chart(this.recentTransactions);

  // getは動的に計算してくれるプロパティ
  // このmapではキーはString,値はObject
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var R = recentTransactions[i];
        // 年、月、日がrecentTransactionsと等しいかをチェック
        if (R.date.day == weekDay.day &&
            R.date.month == weekDay.month &&
            R.date.year == weekDay.year) {
          //全ての取引を調べ、その平日に発生した各取引の合計と金額を平日の総和に追加する
          totalSum += R.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);
      // 中括弧で囲んでmapを作成し、その中で2つの情報を返す（曜日とその日の総消費額）
      // DateFormat.E=月曜はM、火曜はTといったようになる
      return {
        // Stringの文字列から一部を取り出すためには、substringメソッド 第一引数は開始位置、第二引数は終了位置を指定する
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    // foldは初期値と2つの引数をとる関数を使って、要素を最終的に1つの値にまとめるメソッド
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            //引数はChartBar(label, spendingAmount, spendingPctOfTotal)
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
