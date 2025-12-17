import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsService {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<num> extraPerChickenStream() {
    return _firestore
        .collection('settings')
        .doc('chicken_settings')
        .snapshots()
        .map((doc) {
          return (doc.data()?['extra_per_chicken'] ?? 0) as num;
        });
  }
}
