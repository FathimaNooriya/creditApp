import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/creditor/creditor_model.dart';
import '../../domain/model/transaction/transaction_model.dart';
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

  Future<void> updateCreditorId({required String creditorId}) async {
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

  Future<void> updateCreditorOutsnding(
      {required String creditorId, required double amount}) async {
    final data = CreditorEntity(totalOutstandingCredit: amount).toJson();
    data.removeWhere((key, value) => value == null);
    try {
      await firestore.collection('creditors').doc(creditorId).update(data);
      print("Amount updated successfully");
    } catch (e) {
      print("Failed to update amount: $e");
      rethrow;
    }
  }

  Future<void> updateCreditor({required CreditorModel creditor}) async {
    print(creditor.id);
    try {
      await firestore
          .collection('creditors')
          .doc(creditor.id)
          .update(creditor.toJson());
      print("Creditor .......updated ........successfully");
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

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      // Add the transaction to Firestore and get the DocumentReference
      DocumentReference docRef =
          await firestore.collection('transactions').add(transaction.toJson());

      // Get the generated transaction ID
      String transactionId = docRef.id;
      print("Transaction added successfully with ID: $transactionId");

      // Update the transaction with the generated ID
      await docRef.update({'transactionId': transactionId});
      print("Transaction ID updated successfully");
    } catch (e) {
      print("Failed to add or update transaction: $e");
      rethrow;
    }
  }

  // Future<List<TransactionModel>> fetchTransactions(String creditorId) async {
  //   try {
  //     final snapshot = await firestore
  //         .collection('transactions')
  //         .where('creditorId', isEqualTo: creditorId)
  //         .get();
  //     return snapshot.docs
  //         .map((doc) => TransactionModel.fromJson(doc as Map<String, dynamic>))
  //         .toList();
  //   } catch (e) {
  //     print("Failed to fetch transactions: $e");
  //     rethrow;
  //   }
  // }

  Future<CreditorModel> getCreditorById(String creditorId) async {
    final doc = await firestore.collection('creditors').doc(creditorId).get();
    return CreditorModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<List<TransactionModel>> getTransactionsByCreditorId(
      String creditorId) async {
    final snapshot = await firestore
        .collection('transactions')
        .where('creditorId', isEqualTo: creditorId)
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data()))
        .toList();
  }
}
