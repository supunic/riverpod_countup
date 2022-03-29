import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';

class TimestampDataRepositoryImpl implements TimestampDataRepository {
  static const collectionName = 'collection_count';

  static final TimestampDataRepositoryImpl _cache =
      TimestampDataRepositoryImpl._internal();

  TimestampDataRepositoryImpl._internal();

  factory TimestampDataRepositoryImpl() {
    return _cache;
  }

  final _collection = FirebaseFirestore.instance.collection(collectionName);

  @override
  void saveCountData(TimestampData timestampData) {
    _collection.add(timestampData.toJson());
  }

  @override
  Stream<QuerySnapshot> getSnapshots() {
    return _collection
        .orderBy('dateTime', descending: true)
        .limit(5)
        .snapshots();
  }
}
