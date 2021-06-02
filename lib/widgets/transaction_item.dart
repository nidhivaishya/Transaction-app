import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.greenAccent[100],
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\u20B9${widget.transaction.amount}',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        title: Text(widget.transaction.title,
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date),
            style: TextStyle(fontFamily: 'Raleway')),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Confirm Deletion',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Are you sure you want to delete this transaction?',
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 17),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            color: Colors.cyan[200],
                            textColor: Colors.black,
                            child: Text('Yes'),
                            onPressed: () =>
                                widget.deleteTx(widget.transaction.id),
                          ),
                          FlatButton(
                            color: Colors.cyan[200],
                            textColor: Colors.black,
                            child: Text('No'),
                            onPressed: () => {
                              setState(() {
                                Navigator.pop(context);
                              })
                            },
                          ),
                        ],
                      );
                    }),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Confirm Deletion',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Are you sure you want to delete this transaction?',
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 17),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            textColor: Colors.black,
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => {
                              setState(() {
                                widget.deleteTx(widget.transaction.id);
                                Navigator.pop(context);
                              })
                            },
                          ),
                          FlatButton(
                            textColor: Colors.black,
                            child: Text(
                              'No',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => {
                              setState(() {
                                Navigator.pop(context);
                              })
                            },
                          ),
                        ],
                      );
                    }),
              ),
      ),
    );
  }
}
