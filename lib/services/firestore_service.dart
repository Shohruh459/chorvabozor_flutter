import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveUserData(User user) async {
    try {
      DocumentReference userRef = _firestore.collection('users').doc(user.uid);

      // Foydalanuvchi hujjati mavjudligini tekshiramiz
      final doc = await userRef.get();
      if (!doc.exists) {
        await userRef.set({
          'uid': user.uid,
          'name': user.displayName ?? "",
          'email': user.email ?? "",
          'phone': user.phoneNumber ?? "",
          'profileImage': user.photoURL ?? "",
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      print("Firestore saqlashda xatolik: $e");
    }
  }
}
