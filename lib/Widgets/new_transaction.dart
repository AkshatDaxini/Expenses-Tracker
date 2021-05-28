import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx);
  Function addTx;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController title = new TextEditingController();
  DateTime? date;
  TextEditingController amount = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 1.5)),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(labelText: "Title"),
                  controller: title,
                  keyboardType: TextInputType.name,
                  onSubmitted: (_) => AddTransaction(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "Amount",
                  ),
                  controller: amount,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => AddTransaction(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date == null
                          ? "No Date Selected!"
                          : DateFormat.yMMMd().format(date!),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Choose Date",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.date_range,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2019),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          if (value == null) {
                            return null;
                          } else {
                            setState(() {});
                            return date = value;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: AddTransaction,
                      child: Text("Add Transaction")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void AddTransaction() {
    if (title.text.isEmpty ||
        amount.text.isEmpty ||
        date == null ||
        double.parse(amount.text) <= 0) {
      print("Invalid Data");
    } else {
      widget.addTx(
          title.text,
          double.parse(amount.text),
          date!);
      Navigator.of(context).pop();
    }
  }
}
