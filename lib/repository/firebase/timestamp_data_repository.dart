import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';

class TimestampDataRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('collection_count');

  void saveCountData(TimestampData timestampData) {
    _collection.add(timestampData.toJson());
  }

  Stream<QuerySnapshot> getSnapshots() {
    return _collection
        .orderBy('dateTime', descending: true)
        .limit(5)
        .snapshots();
  }
}
