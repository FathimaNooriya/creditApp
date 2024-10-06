import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/creditor/creditor_model.dart';
import '../entities/creditor_entity.dart';

class FirestoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> addCreditor({required CreditorModel creditor}) async {
    try {
      // Add the creditor and get the document reference
      DocumentReference docRef =
          await firestore.collection('creditors').add(creditor.toJson());
      // Get the ID of the newly added document
      String creditorId = docRef.id;
      print("Creditor added successfully with ID: $creditorId");

      // Return the ID for further use (e.g., updating the creditor model)
      return creditorId;
    } catch (e) {
      print("Failed to add creditor: $e");
      rethrow; // rethrow the error if you want it to propagate further
    }
  }

  Future<void> updateCreditor({required String creditorId}) async {
    final data = CreditorEntity(id: creditorId).toJson();
    data.removeWhere((key, value) => value == null);
    try {
      await firestore.collection('creditors').doc(creditorId).update(data);
      print("Creditor updated successfully");
    } catch (e) {
      print("Failed to update creditor: $e");
      rethrow;
    }
  }

  Future<void> deleteCreditor(String id) async {
    try {
      await firestore.collection('creditors').doc(id).delete();
      print("Creditor deleted successfully");
    } catch (e) {
      print("Failed to delete creditor: $e");
      rethrow;
    }
  }

  Future<List<CreditorModel>> fetchCreditors() async {
    try {
      final snapshot = await firestore.collection('creditors').get();
      return snapshot.docs
          .map((doc) => CreditorModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print("Failed to fetch creditors: $e");
      rethrow;
    }
  }
}
