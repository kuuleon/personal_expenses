// import 'package:flutter/material.dart';
// import './new_transaction.dart';
// import './transaction_list.dart';
// import '../models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: 'New shows',
//       amount: 70.00,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'New pants',
//       amount: 10.00,
//       date: DateTime.now(),
//     ),
//   ];

//   // _から始まるクラス名にすることでプライベートなクラスの一部であることがわかる
//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//       title: txTitle,
//       amount: txAmount,
//       date: DateTime.now(),
//       id: DateTime.now().toString(),
//     );

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         NewTransaction(_addNewTransaction),
//         TransactionList(_userTransactions),
//       ],
//     );
//   }
// }
