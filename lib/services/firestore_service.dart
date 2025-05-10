import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setDocument(
    String collectionPath,
    String docId,
    Map<String, dynamic> data,
  ) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).set(data);
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> streamDocuments(String collectionPath) {
    return _firestore
        .collection(collectionPath)
        .snapshots()
        .map(
          (querySnapshot) =>
              querySnapshot.docs.map((doc) => doc.data()).toList(),
        );
  }
}
