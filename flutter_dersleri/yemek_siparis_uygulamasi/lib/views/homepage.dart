import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/components/orange_animated_button.dart';
import 'package:yemek_siparis_uygulamasi/views/foods_page.dart';
import 'package:yemek_siparis_uygulamasi/views/login_page.dart';
import 'package:yemek_siparis_uygulamasi/views/sign_up_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var tfKullanici = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Welcome to Zeynep's Restaurant Order App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PatrickHand',
                fontSize: 40,
                color: Colors.deepOrange,
              ),),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Enter the name you want to be called",
                style: TextStyle(
                  fontSize: 20
                ),),
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: tfKullanici,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
              ),
              ColoredAnimatedButton(
                title: 'Enjoy Your Meal',
                route: FoodsPage(kullanici_adi: tfKullanici.text),
              ),
              const Text('or'),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));
              }, child: const Text('Sign Up', style: TextStyle(
                fontSize: 20
              ),)),
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
    );
  }
}