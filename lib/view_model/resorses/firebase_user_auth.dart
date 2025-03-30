import 'package:college_project/components/show_snackbar.dart';
import 'package:college_project/entry_point.dart';
import 'package:college_project/view_model/resorses/firebase_store_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseUserAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStoreData firebaseStoreData = FirebaseStoreData();

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        print("✅ User created successfully: ${user.uid}");

        await firebaseStoreData.Shoplon(user.uid, {'email': email})
            .then((value) async {
              print("✅ Data stored successfully, navigating...");
              Get.to(() => EntryPoint());
            })
            .onError((error, stackTrace) {
              print("❌ Error storing data: $error");
            });
      } else {
        ShowSnackbar.showSnackbar(
          title: 'Sign Up fail',
          message: 'User is not created',
        );
      }
    } on FirebaseAuthException catch (e) {
      ShowSnackbar.showSnackbar(
        title: 'Firebase Exception',
        message: e.message.toString(),
      );
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        //go to home page
        Get.to(EntryPoint());
      } else {
        ShowSnackbar.showSnackbar(
          title: 'Sign In fail',
          message: 'email and password not found in firebase',
        );
      }
    } on FirebaseAuthException catch (e) {
      ShowSnackbar.showSnackbar(
        title: 'firebase exception',
        message: e.message.toString(),
      );
    }
  }

  Future<void> signInMethods(String email) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      List<String> methods = await auth.fetchSignInMethodsForEmail(email);
      print('Sign-in methods for $email: $methods');
    } on FirebaseAuthException catch (e) {
      print('Error fetching sign-in methods: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  // do not uncomment this;

  // void method(String email, String password, String work) async {
  //   UserCredential userCredential;
  //   if (work == 'signUp') {
  //     userCredential = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } else if (work == 'signIn') {
  //     userCredential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } else {
  //     ShowSnackbar.showSnackbar(
  //       title: 'fail',
  //       message: 'something wents wrong',
  //     );
  //   }
  //   if (userCredential.user != null) {
  //     //store email
  //   } else {
  //     ShowSnackbar.showSnackbar(
  //       title: 'Sign Up fail',
  //       message: 'User is not created',
  //     );
  //   }
  // }
}
