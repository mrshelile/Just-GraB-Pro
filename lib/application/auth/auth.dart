import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<Response> updatePassword(
      {required String oldpassword,
      required String email,
      required String newPassword}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: oldpassword);
      userCredential.user!.updatePassword(newPassword);
      // var de = await firestore.collection("users");

      return const Response(statusCode: 200, body: "Authenticated");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Response(statusCode: 204, body: "User not found");
      } else if (e.code == 'wrong-password') {
        return const Response(statusCode: 401, body: "Wrong password");
      }

      return const Response(statusCode: 500, body: "no connection");
    }
  }

  Future<Response> blockRestaurant({required String email}) async {
    try {
      final res = await firestore
          .collection("restaurants")
          .where("email", isEqualTo: email)
          .get();
      final user = await res.docs.first.reference.update({"allowed": false});
      print(res.docs.first.reference);
    } catch (e) {
      print(e);
    }
    return const Response(statusCode: 500, body: "Unhandled error");
  }

  Future<Response> unblockRestaurant({required String email}) async {
    try {
      final res = await firestore
          .collection("restaurants")
          .where("email", isEqualTo: email)
          .get();
      final user = await res.docs.first.reference.update({"allowed": true});
      print(res.docs.first.reference);
    } catch (e) {
      print(e);
    }
    return const Response(statusCode: 500, body: "Unhandled error");
  }

  Future<Response> unblockClient({required String email}) async {
    try {
      final res = await firestore
          .collection("users")
          .where("email", isEqualTo: email)
          .get();
      // print(email);
      final user = await res.docs.first.reference.update({"allowed": true});
      // print(res.docs.first.reference);
    } catch (e) {
      print(e);
    }
    return const Response(statusCode: 500, body: "Unhandled error");
  }

  Future<Response> blockClient({required String email}) async {
    try {
      final res = await firestore
          .collection("users")
          .where("email", isEqualTo: email)
          .get();

      final user = await res.docs.first.reference.update({"allowed": false});
      // print(res.docs.first.reference);
    } catch (e) {
      print(e);
    }
    return const Response(statusCode: 500, body: "Unhandled error");
  }

  Future<Response> userLogin(
      {required String emailAddress, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      // var de = await firestore.collection("users");

      return const Response(statusCode: 200, body: "Authenticated");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Response(statusCode: 204, body: "User not found");
      } else if (e.code == 'wrong-password') {
        return const Response(statusCode: 401, body: "Wrong password");
      }

      return const Response(statusCode: 500, body: "no connection");
    }
  }

  // Future<Response> signUp(
  //     {required String emailAddress,
  //     required String password,
  //     required String fullName,
  //     required String phone}) async {
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //         email: emailAddress, password: password);

  //     await firestore.collection("users").add({
  //       "full_name": fullName,
  //       "phone_number": phone,
  //       "location": {},
  //       "orders": [],
  //       "user_id": userCredential.user!.uid
  //     });
  //     return const Response(statusCode: 201, body: "user created");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return const Response(statusCode: 409, body: "weak password");
  //     } else if (e.code == 'email-already-in-use') {
  //       return const Response(statusCode: 409, body: "email already in use");
  //     }
  //     return const Response(statusCode: 500, body: "Unhandled error");
  //   } catch (e) {
  //     return const Response(statusCode: 500, body: "Unhandled error");
  //   }
  // }
}
