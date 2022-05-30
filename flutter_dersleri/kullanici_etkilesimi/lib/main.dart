import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcı Etkileşimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Silmek istiyor musunuz?"),
                    action: SnackBarAction(
                        label: "Evet", onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Silindi")),);
                    }),
                  ),
                );
              },
              child: const Text('SnackBar (Varsayılan)'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("İnternet bağlantısı yok", style: TextStyle(color: Colors.indigoAccent),),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(
                        label: "Tekrar Dene",
                        textColor: Colors.red,
                        onPressed: (){
                    }),
                  ),
                );
              },
              child: const Text('SnackBar (Özel)'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Başlık'),
                        content: const Text('İçerik'),
                        actions: [
                          TextButton(onPressed: () {
                            print('İptal seçildi');
                            Navigator.pop(context);
                          }, child: const Text('İptal')),
                          TextButton(onPressed: () {
                            print('Tamam seçildi');
                            Navigator.pop(context);
                          }, child: const Text('Tamam')),

                        ],
                      );
                    },
                );
              },
              child: const Text('Alert (Varsayılan)'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Kayıt İşlemi'),
                      content: TextField(controller: tfControl, decoration: const InputDecoration(hintText: 'Veri'),),
                      backgroundColor: Colors.grey,
                      actions: [
                        TextButton(onPressed: () {
                          print('İptal seçildi');
                          Navigator.pop(context);
                        }, child: const Text('İptal', style: TextStyle(color: Colors.black)),),
                        TextButton(onPressed: () {
                          print('Alınan Veri: ${tfControl.text}');
                          Navigator.pop(context);
                        }, child: const Text('Kaydet', style: TextStyle(color: Colors.black))),
                      ],
                    );
                  },
                );
              },
              child: const Text('Alert (Özel)'),
            ),
          ],
        ),
      ),
    );
  }
}

