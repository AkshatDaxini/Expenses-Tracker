import 'dart:ui';

import 'package:expenses_tracker/Model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction_List extends StatelessWidget {
  Transaction_List(this.transactions, this.deleteTransaction);
  List<Transaction> transactions = [];
  Function deleteTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction Added Yet!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.contain,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FittedBox(
                          child: Text(
                            '${transactions[index].amount.toStringAsFixed(0)} Rs',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(
                        transactions[index].date,
                      ),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed:() => deleteTransaction(transactions[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
