import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/user_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/user.dart';
import 'package:yemek_siparis_uygulamasi/views/components/text_field_with_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isEditing = false;
  TheUser? theUser;

  @override
  void initState() {
    super.initState();
    context.read<UserPageCubit>().loadTheUser();
  }

  var tfUserName = TextEditingController();
  var tfName = TextEditingController();
  var tfSurnmame = TextEditingController();
  var tfMailAdress = TextEditingController();

  //var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Your Account",
          style: TextStyle(
            fontFamily: 'PatrickHand',
            fontSize: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: BlocBuilder<UserPageCubit, List<TheUser>>(
            builder: (context, userList) {
              if (userList.isNotEmpty) {
                theUser = userList[0];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldWithController(
                      hintText: theUser?.username ?? '',
                      controller: tfUserName,
                      label: 'Username',

                    ),
                    TextFieldWithController(
                      hintText: theUser?.name ?? '',
                      controller: tfName,
                      label: 'Name',
                    ),
                    TextFieldWithController(
                      hintText: theUser?.surname ?? '',
                      controller: tfSurnmame,
                      label: 'Surname',
                    ),
                    TextFieldWithController(
                      hintText: theUser?.email ?? '',
                      controller: tfMailAdress,
                      label: 'E-Mail',
                    ),
                    AnimatedButton(
                      onPressed: () {
                      }, child: const Text('Change'),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('HATA'),);
              }
            },
          ),
        ),
      ),
    );
  }
}
