import 'dart:developer';

import 'package:flutter/material.dart';

class ExcelScreen extends StatefulWidget {
  const ExcelScreen({
    required this.data,
    Key? key,
  }) : super(key: key);

  final data;

  @override
  _ExcelScreenState createState() => _ExcelScreenState();
}

class _ExcelScreenState extends State<ExcelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.data.length - 1,
        itemBuilder: (_, index) {
          log(widget.data[index]);
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.blue : Colors.white,
            child: ListTile(
              title: Text(widget.data[index].toString().split(',')[0] == 'null'
                  ? 'No Student ID'
                  : widget.data[index].toString().split(',')[0]),
              trailing: Text(
                  (widget.data[index].toString().split(',')[1]) == 'null'
                      ? "0"
                      : (widget.data[index].toString().split(',')[1])),
            ),
          );
        },
      ),
    );
  }
}
