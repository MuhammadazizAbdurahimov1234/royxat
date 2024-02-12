import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class AddApp extends StatefulWidget {
  const AddApp({super.key});

  @override
  State<AddApp> createState() => _MyAppState();
}

class _MyAppState extends State<AddApp> {
  TextEditingController maxsulotnomitxt = TextEditingController();
  TextEditingController maxsulotsotlishnarxitxt = TextEditingController();
  TextEditingController maxsulotsonitxt = TextEditingController();
  TextEditingController maxsulotaslnarxitxt = TextEditingController();
  final CollectionReference pupilsCollection =
      FirebaseFirestore.instance.collection("pupils");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Maxsulotni kiriting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: maxsulotnomitxt,
            decoration: InputDecoration(
                label: Text("Maxsulot nomi"), border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: maxsulotsonitxt,
            decoration: InputDecoration(
                label: Text("Maxsulot soni"), border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: maxsulotsotlishnarxitxt,
            decoration: InputDecoration(
                label: Text("Maxsulot sotlish narxi"),
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: maxsulotaslnarxitxt,
            decoration: InputDecoration(
                label: Text("Maxsulot asl narxi"),
                border: OutlineInputBorder()),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                if (maxsulotnomitxt.text.length != 0 &&
                    maxsulotsonitxt.text.length != 0 &&
                    maxsulotsotlishnarxitxt.text.length != 0 &&
                    maxsulotaslnarxitxt.text.length != 0) {
                  Map<String, dynamic> pupil = {
                    "Maxsulot_nomi": maxsulotnomitxt.text,
                    "Maxsulot_soni": maxsulotsonitxt.text,
                    "Maxsulot_sotlish_narxi ": maxsulotsotlishnarxitxt.text,
                    "Maxsulot_asl_narxi": maxsulotaslnarxitxt.text
                  };
                  pupilsCollection.add(pupil);
                  maxsulotnomitxt = TextEditingController(text: "");
                  maxsulotsonitxt = TextEditingController(text: "");
                  maxsulotaslnarxitxt = TextEditingController(text: "");
                  maxsulotsotlishnarxitxt = TextEditingController(text: "");

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Maxsulot saqlandi",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )));
                }
              });
            },
            child: Text(
              "Maxsulotni saqlash",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
