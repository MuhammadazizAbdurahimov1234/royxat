import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tugma extends StatefulWidget {
  const tugma({super.key});

  @override
  State<tugma> createState() => _tugmaState();
}

class _tugmaState extends State<tugma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Maxslot sonini kiriting"),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.green,
            child: Text(
              "Soltish",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
