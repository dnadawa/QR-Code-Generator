import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getExcelFile() async {
    return await _firestore.collection('excel').get();
  }

}