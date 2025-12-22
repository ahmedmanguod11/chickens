import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsService {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<num> extraPerChickenStream() {
    return _firestore
        .collection('ahmedadd')
        .doc('ahmedadd')
        .snapshots()
        .map((doc) {
          return (doc.data()?['ahmedadd'] ?? 0) as num;
        });
  }
}
