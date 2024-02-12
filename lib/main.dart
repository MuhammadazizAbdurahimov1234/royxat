import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e/ikki.dart';
import 'package:e/qoshish.dart';
import 'package:e/tugma.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController maxsulotnomiEdit = TextEditingController();
  TextEditingController maxsulotsoniEdit = TextEditingController();
  TextEditingController maxsulotsotlishnarxiEdit = TextEditingController();
  TextEditingController maxsulotaslnarxiEdit = TextEditingController();

  CollectionReference pupilsCollection =
      FirebaseFirestore.instance.collection("pupils");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Maxsulotlar ro'yxati",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
          stream: pupilsCollection.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onLongPress: () {
                          pupilsCollection.doc(document.id).delete();
                        },
                        onTap: () {
                          maxsulotnomiEdit = TextEditingController(
                              text: document['Maxsulot nomi']);
                          maxsulotsoniEdit = TextEditingController(
                              text: document['Maxsulot soni']);
                          maxsulotsotlishnarxiEdit = TextEditingController(
                              text: document['Maxsulot sotlish narxi']);
                          maxsulotaslnarxiEdit = TextEditingController(
                              text: document["Maxsulot asl narxi"]);
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Malumotni o'zgartirish"),
                                  actions: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: maxsulotnomiEdit,
                                            decoration: InputDecoration(
                                                label: Text("Maxsulot nomi"),
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: maxsulotsoniEdit,
                                            decoration: InputDecoration(
                                                label: Text("Maxsulot soni"),
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller:
                                                maxsulotsotlishnarxiEdit,
                                            decoration: InputDecoration(
                                                label: Text(
                                                    "Maxsulot sotlish narxi"),
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: maxsulotaslnarxiEdit,
                                            decoration: InputDecoration(
                                                label:
                                                    Text("Maxsulot asl narxi"),
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Bekor qilish")),
                                            MaterialButton(
                                              onPressed: () {
                                                pupilsCollection
                                                    .doc(document.id)
                                                    .update({
                                                  "Maxsulot nomi":
                                                      maxsulotnomiEdit.text,
                                                  "Maxsulot soni":
                                                      maxsulotsoniEdit.text,
                                                  "Maxsulot sotlish narxi":
                                                      maxsulotsotlishnarxiEdit
                                                          .text,
                                                  "Maxsulot asl narxi":
                                                      maxsulotaslnarxiEdit.text
                                                });
                                                Navigator.pop(context);
                                                maxsulotnomiEdit.clear();
                                                maxsulotsoniEdit.clear();
                                                maxsulotsotlishnarxiEdit
                                                    .clear();
                                                maxsulotaslnarxiEdit.clear();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Colors.green,
                                                        content: Text(
                                                          "O'zgartirildi",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        )));
                                              },
                                              child: Text("O'zgartrish"),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Maxsulot nomi : ${document['Maxsulot_nomi']}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                    "Maxsulot soni : ${document['Maxsulot_soni']}",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                  "Maxsulot sotlish narxi:${document["Maxsulot_sotlish_narxi "]}",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "Maxsulot asl narxi : ${document['Maxsulot_asl_narxi']}",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MaterialButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return tugma();
                                              });
                                        },
                                        color: Colors.green,
                                        child: Text(
                                          "Sotish",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    MaterialButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return qoshish();
                                            });
                                      },
                                      color: Colors.green,
                                      child: Text(
                                        "+",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("Malumot yo'q"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddApp()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
