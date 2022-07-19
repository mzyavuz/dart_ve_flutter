import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/sign_in_page_cubit.dart';
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
  var tfMailAdress = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFieldWithController(
              hintText: '',
              controller: tfMailAdress,
              label: 'E-Mail',
            ),
            TextFieldWithController(
              hintText: '',
              controller: tfPassword,
              label: 'Password',
            ),
            AnimatedButton(onPressed: () {
              context.read<SignInPageCubit>().signIn(tfMailAdress.text, tfPassword.text);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodsPage(kullanici_adi: "")));
            }, child: const Text('Login')),
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
