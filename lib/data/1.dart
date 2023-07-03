import 'package:cloud_firestore/cloud_firestore.dart';

class Money {
  String? image;
  String? name;
  String? time;
  String? fee;
  bool? buy;
}

void uploadMoneyToFirebase(Money money) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  firestore.collection('money').add({
    'image': money.image,
    'name': money.name,
    'time': money.time,
    'fee': money.fee,
    'buy': money.buy,
  }).then((value) {
    print('Money uploaded successfully!');
  }).catchError((error) {
    print('Failed to upload money: $error');
  });
}

void main() {
  // Create an instance of the Money class
  Money money = Money();
  money.image = 'image_url';
  money.name = 'Money Name';
  money.time = 'Time';
  money.fee = 'Fee';
  money.buy = true;

  // Upload money to Firebase
  uploadMoneyToFirebase(money);
}
