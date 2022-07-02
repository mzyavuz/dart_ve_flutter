import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/components/orange_animated_button.dart';
import 'package:yemek_siparis_uygulamasi/views/components/text_field_with_controller.dart';
import 'package:yemek_siparis_uygulamasi/views/foods_page.dart';
import 'package:yemek_siparis_uygulamasi/views/homepage.dart';
import 'package:yemek_siparis_uygulamasi/views/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Login to your Account",
          style: TextStyle(
            fontFamily: 'PatrickHand',
            fontSize: 35,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFieldWithController(
              controller: tfUserName,
              label: 'User Name',
            ),
            TextFieldWithController(
              controller: tfPassword,
              label: 'Password',
            ),
            ColoredAnimatedButton(route: const FoodsPage(kullanici_adi: 'mzyavuz',), title: 'Login'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account"),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));
                  },
                  child: const Text("Sign Up")),
              ],
            ),
            const Text('or'),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage(),));
              },
              child: const Text('Continue Anonymously', ),
            ),
          ],
        ),
      ),
    );
  }
}
