// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../domain/model/creditor/creditor_model.dart';
// import '../../domain/model/transaction/transaction_model.dart';

// class FirestoreService {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<CreditorModel> getCreditorById(String creditorId) async {
//     final doc = await firestore.collection('creditors').doc(creditorId).get();
//     return CreditorModel.fromJson(doc.data() as Map<String, dynamic>);
//   }

//   Future<List<TransactionModel>> getTransactionsByCreditorId(
//       String creditorId) async {
//     final snapshot = await firestore
//         .collection('transactions')
//         .where('creditorId', isEqualTo: creditorId)
//         .get();

//     return snapshot.docs
//         .map((doc) => TransactionModel.fromJson(doc.data()))
//         .toList();
//   }
// }
