import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/components/orange_animated_button.dart';
import 'package:yemek_siparis_uygulamasi/views/homepage.dart';
import 'package:yemek_siparis_uygulamasi/views/login_page.dart';
import 'package:yemek_siparis_uygulamasi/views/sign_up_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List imagesPath = ['assets/images/Order food-pana.png','assets/images/Order food-bro.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                  itemCount: 2,
                  pageSnapping: true,
                  itemBuilder: (context, index){
                    return Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(imagesPath[index]),
                    );
                  }),
            ),
            const Text("Welcome to", style: TextStyle(fontSize: 25),),
            const Text("Zeynep's Restaurant", style: TextStyle(fontSize: 45, fontFamily: 'PatrickHand', color: Colors.deepOrange, backgroundColor: Colors.yellow),),
            const ColoredAnimatedButton(route: LoginPage(), title: 'Login'),
            const ColoredAnimatedButton(route: SignUpPage(), title: 'Sign Up'),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage(),));
              },
              child: const Text('Continue Anonymously', ),
            )
          ],
        ),
      ),
    );
  }
}