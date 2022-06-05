import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uygulama_mimarisi/matematik_repository.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit(): super(0); // Burada 0 varsayılan değeri (yani emit(0) gönderiyor)

  var mrepo = MatematikRepository();

  void toplamaYap(String alinanSayi1, String alinanSayi2) {
    /*int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int toplam = sayi1 + sayi2;*/
    emit(mrepo.topla(alinanSayi1, alinanSayi2)); // göndereceği değeri içine yazıyoruz (int)
  }

  void carpmaYap(String alinanSayi1, String alinanSayi2) {
    /*int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int carpma = sayi1 * sayi2;*/
    emit(mrepo.carp(alinanSayi1, alinanSayi2)); // göndereceği değeri içine yazıyoruz (int)
  }
}