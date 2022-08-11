import 'package:get/get.dart';
import 'package:teen_browser/functions/secure_storage.dart';

class PaginationController extends GetxController {
  RxInt pageNumber = RxInt(1);
  RxString userName = RxString("");
  RxString userSurname = RxString("");
  RxString userEmail = RxString("");
  RxString userPassword = RxString("");
  RxString userPasswordConfirm = RxString("");
  RxString userPhone = RxString("");
  RxnBool isSkipped = RxnBool(false);
  void CheckSkipStatus() async {
    final resp = await UserSecureStorage.isSkip();
    isSkipped.value = resp;
  }
}
