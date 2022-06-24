import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/repo/yemekler_repository.dart';

class SepetEkraniCubit extends Cubit<List<Yemek>> {
  SepetEkraniCubit():super(<Yemek>[]);

  var yemekRepo = YemeklerRepository();

  Future<void> sepettekiYemekleriYukle(String kullanici_adi) async {
    var sepettekiyemekListesi = await yemekRepo.sepettekiYemekleriGetir(kullanici_adi);
    emit(sepettekiyemekListesi);
  }

  Future<void> yemegiSil(int sepet_yemek_id, String kullanici_adi) async {
    await yemekRepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
    await sepettekiYemekleriYukle(kullanici_adi);
  }


}