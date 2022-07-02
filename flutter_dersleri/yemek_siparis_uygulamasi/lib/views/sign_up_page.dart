import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/components/orange_animated_button.dart';
import 'package:yemek_siparis_uygulamasi/views/components/text_field_with_controller.dart';
import 'package:yemek_siparis_uygulamasi/views/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var tfUserName = TextEditingController();
  var tfName = TextEditingController();
  var tfSurnmame = TextEditingController();
  var tfMailAdress = TextEditingController();
  var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Create your Account",
          style: TextStyle(
            fontFamily: 'PatrickHand',
            fontSize: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldWithController(
                controller: tfUserName,
                label: 'User Name',
              ),
              TextFieldWithController(
                controller: tfName,
                label: 'Name',
              ),
              TextFieldWithController(
                controller: tfSurnmame,
                label: 'Surname',
              ),
              TextFieldWithController(
                controller: tfMailAdress,
                label: 'E-Mail',
              ),
              TextFieldWithController(
                controller: tfPassword,
                label: 'Password',
              ),
              const ColoredAnimatedButton(route: LoginPage(), title: 'Sign Up'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: const Text("Log In")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}