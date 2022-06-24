import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  FilterPage(
      {Key? key,
      required this.filter,
      required this.filterNull,
      required this.title,
      required this.items,
      required this.type})
      : super(key: key);

  final Function filter;
  final Function filterNull;
  final String title;
  final List items;
  final String type;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _value = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (_value == 0) {
                  widget.filterNull("");
                  Navigator.of(context).pop();
                } else {
                  widget.filter(widget.type, _result);
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                color: Colors.grey[900],
                child: Row(
                  children: [
                    Radio(
                        value: index,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = index;
                            _result = widget.items[index];
                          });
                        }),
                    Text(
                      widget.items[index],
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
