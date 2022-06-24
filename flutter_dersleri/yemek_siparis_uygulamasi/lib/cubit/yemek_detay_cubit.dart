import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/repo/yemekler_repository.dart';


class YemekDetayCubit extends Cubit<void> {
  YemekDetayCubit():super(0);

  var yemekRepo = YemeklerRepository();

  Future<void> sepeteYemekEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    await yemekRepo.sepeteYemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }


}