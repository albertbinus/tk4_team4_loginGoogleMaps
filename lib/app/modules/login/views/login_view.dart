import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
     controller.signInWithGoogle();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: Center(
        child: const CircularProgressIndicator(), // Menampilkan indikator loading
      ),
    );
  }
}