import 'package:ders_1/1.3_nesne_tabanli_2/interface/my_interface.dart';

class ClassA implements MyInterface {

  @override
  int degisken = 10;

  @override
  void metod1() {
    print("Metod 1 calisti");
  }

  @override
  String metod2() {
    return "Metod 2 calisti";
  }

}