import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class qoshish extends StatefulWidget {
  const qoshish({super.key});

  @override
  State<qoshish> createState() => _qoshishState();
}

class _qoshishState extends State<qoshish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Maxslot sonini qoshing"),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.green,
            child: Text(
              "Qoshish",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
