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

  String alinanVeri ="";
  var tfController = TextEditingController();
  String resimAdi = "baklava.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 50.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add('Türkiye');
    ulkelerListesi.add('İtalya');
    ulkelerListesi.add('Japonya');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Widgets Kullanımı")),
      body: SingleChildScrollView( //Dikeyde sonsuza kadar gitmemesi gerekiyor
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(hintText: "Veri",),
                  keyboardType: TextInputType.number,
                  obscureText: true, //şifre girerken gibi yıldızlı oluyor
                ),
              ),
              TextButton(
                onPressed: () {
                  setState (() {
                    alinanVeri = tfController.text;
                  });
                },
                child: const Text("Veriyi al"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(
                              () {
                            resimAdi = "baklava.png";
                          },
                        );                    },
                      child: const Text('Resim 1'),
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          resimAdi = "kadayif.png";
                        },
                      );
                    },
                    child: const Text('Resim 2'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: SwitchListTile(
                        title: const Text('Dart'),
                        controlAffinity: ListTileControlAffinity.leading, //Checkbox kısmına başa alıyor
                        value: switchKontrol,
                        onChanged: (bool? veri) {
                          setState(() {
                            switchKontrol = veri!;
                            print("Switch: $veri");
                          });
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: CheckboxListTile( //Yayılmak istiyor ama yer olmadığında sıkıntı oluşuyor
                      title: const Text('Flutter'),
                      controlAffinity: ListTileControlAffinity.leading, //Checkbox kısmına başa alıyor
                      value: checkboxKontrol,
                      onChanged: (bool? veri) {
                       setState(() {
                         checkboxKontrol = veri!;
                         print("Checkbox: $veri");
                       });
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: const Text('Barcelona'),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (int? veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: const Text('Real Madrid'),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (int? veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                          progressKontrol = true;
                        },
                      );                    },
                    child: const Text('Başla'),
                  ),
                  Visibility(
                    visible: progressKontrol,
                      child: const CircularProgressIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressKontrol = false;
                        },
                      );
                    },
                    child: const Text('Dur'),
                  ),
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(max: 100.0, min: 0.0, value: ilerleme, onChanged: (veri) {
                setState(() {
                  ilerleme = veri;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(
                        hintText: 'Saat',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(DateTime.now())
                      ).then((value) {
                        tfSaat.text = "${value!.hour} : ${value.minute}";
                      });
                    },
                    icon: const Icon(Icons.access_time)),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(
                        hintText: 'Tarih',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2030),
                        ).then((value) {
                          tfTarih.text = "${value!.day} / ${value.month} / ${value.year}";
                        });
                      },
                      icon: const Icon(Icons.date_range)),
                ],
              ),
              DropdownButton(
                value: secilenUlke,
                icon: const Icon(Icons.arrow_drop_down),
                items: ulkelerListesi.map<DropdownMenuItem<String>>((value){
                  return DropdownMenuItem(value: value,child: Text(value));
                }).toList(),
                onChanged: (String? secilenveri) {
                  setState(() {
                    secilenUlke = secilenveri!;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  print("Container tek tıklandı");
                },
                onDoubleTap: () {
                  print("Container çift tıklandı");
                },
                onLongPress: () {
                  print("Container üzerine uzun basıldı");
                },
                child: Container(width: 200, height: 100, color: Colors.red),
              ),
              ElevatedButton(onPressed: () {
                print("Switch en son durum: $switchKontrol");
                print("Checkbox en son durum: $checkboxKontrol");
                print("RadioButton en son durum: $radioDeger");
                print("Slider en son durum: ${ilerleme.toInt()}");
                print("En son seçilen ülke: $secilenUlke");
              },
                child: const Text("Göster"),
              ),
            ],
          ),
        ),
      )
    );
  }
}
