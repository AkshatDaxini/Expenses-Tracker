import 'package:expenses_tracker/Model/transaction.dart';
import 'package:expenses_tracker/Widgets/new_transaction.dart';
import 'package:expenses_tracker/Widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/Chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.ubuntuMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransaction = [
    Transaction(id: "T1", title: "Shoes", amount: 5000, date: DateTime.now()),
    Transaction(id: "T2", title: "Clothes", amount: 2000, date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount , DateTime date) {
    _usertransaction.add(Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: date));
    setState(() {});
  }

  void _deleteTransactions(String id){
   setState(() {
     _usertransaction.removeWhere((element) => element.id == id);
   });
  }

  List<Transaction> get _recentTransactions {
    return _usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed:() => openBottomModelSheet(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Chart(_recentTransactions),
              ),
            ),
            Transaction_List(_usertransaction , _deleteTransactions),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openBottomModelSheet(context),
      ),
    );
  }

  void openBottomModelSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return NewTransaction(_addTransaction);
      },
    );
  }
}
