import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pemilu/app/routes/app_pages.dart';

class LoginController extends GetxController {
  
  Future<void> signInWithGoogle() async {
    
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await auth.signInWithCredential(credential);
      Get.snackbar('Success', 'Login berhasil');
      Get.offAllNamed(Routes.MAPS);
    } catch (e) {
      Get.snackbar('Error', 'Login gagal');
    }
  }
}
