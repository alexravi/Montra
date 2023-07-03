import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_date.g.dart';

@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datetime;

  Add_data(this.IN, this.amount, this.datetime, this.explain, this.name);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'explain': explain,
      'amount': amount,
      'IN': IN,
      'datetime': datetime,
    };
  }
}

Future<void> uploadHiveDataToFirestore() async {
  await Hive.initFlutter();
  await Hive.openBox<Add_data>('data');

  final box = Hive.box<Add_data>('data');
  final history2 = box.values.toList();

  final collectionRef = FirebaseFirestore.instance.collection('your_collection'); // Replace 'your_collection' with your desired collection name in Firestore

  for (final item in history2) {
    final Map<String, dynamic> data = item.toJson();

    await collectionRef.add(data);
  }

  print('Data uploaded from Hive to Firestore.');

  await Hive.close();
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive to Firestore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hive to Firestore'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: uploadHiveDataToFirestore,
            child: Text('Upload Data to Firestore'),
          ),
        ),
      ),
    );
  }
}
