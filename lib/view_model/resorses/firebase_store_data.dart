import 'package:college_project/components/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseStoreData {
  Future<bool> Shoplon(String uid, Map<String, dynamic> userData) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref('user');

    try {
      if (userData.isEmpty) {
        print("Error: User data is empty!");
        return false;
      }

      print('start');
      print(userData['email']);

      await databaseReference
          .child(uid)
          .set({'email': userData['email']})
          .then((value) => print('data stored'))
          .onError((error, stackTrace) => print(error));

      print('finish');

      return true;
    } catch (e) {
      print("❌ Error storing data: $e");
      ShowSnackbar.showSnackbar(title: 'Database', message: e.toString());
      return false;
    }
  }

  Future<void> retriveUserData() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser != null) {
        String uid = auth.currentUser!.uid;
        DatabaseReference ref = FirebaseDatabase.instance.ref('user/$uid');
        DatabaseEvent event = await ref.once();
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.exists) {
          Map<String, dynamic> userData =
              await snapshot.value as Map<String, dynamic>;
          userData.forEach(
            (key, value) => print('Key : $key , value : $value'),
          );
        }
      } else {
        print('current user is null');
      }
    } on FirebaseException catch (e) {
      print('Firebase Exception : $e');
    } on Exception catch (e) {
      print('Other Exception : $e');
    }
  }

  Future<Map<String, dynamic>?> getDataFromRealtimeDB(String path) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref(path);
      DatabaseEvent event = await ref.once(); // Fetches data once
      return event.snapshot.value as Map<String, dynamic>?;
    } catch (e) {
      print("❌ Error fetching data: $e");
      return null;
    }
  }
}
