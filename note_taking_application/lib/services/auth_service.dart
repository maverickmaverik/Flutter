import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Sign in failed');
    }
  }

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Registration failed');
    }
  }

  Future<String> createNote({
    required String title,
    required String content,
  }) async {
    final user = currentUser;
    if (user == null) throw Exception('Not authenticated');

    try {
      final docRef = await _firestore.collection('notes').add({
        'userId': user.uid,
        'title': title.trim(),
        'content': content.trim(),
        'created_date': Timestamp.now(),
      });
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  Stream<QuerySnapshot> getUserNotes() {
    final user = currentUser;
    if (user == null) throw Exception('Not authenticated');

    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: user.uid)
        .snapshots();
  }

  Future<void> updateNote(
    String noteId, {
    required String title,
    required String content,
  }) async {
    final user = currentUser;
    if (user == null) throw Exception('Not authenticated');

    try {
      await _firestore.collection('notes').doc(noteId).update({
        'title': title.trim(),
        'content': content.trim(),
        'updated_date': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  Future<void> deleteNote(String noteId) async {
    final user = currentUser;
    if (user == null) throw Exception('Not authenticated');

    try {
      await _firestore.collection('notes').doc(noteId).delete();
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
