import 'package:get/get.dart';

class ShowSnackbar {
  static void showSnackbar({required String title, required String message}) {
    Get.snackbar(title, message);
  }
}
