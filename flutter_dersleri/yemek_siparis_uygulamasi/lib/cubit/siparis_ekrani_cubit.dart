import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/repo/yemekler_repository.dart';

class SiparisEkraniCubit extends Cubit<List<Yemek>> {
  SiparisEkraniCubit():super(<Yemek>[]);

  var yemekRepo = YemeklerRepository();

  Future<void> yemekleriYukle() async {
    var yemekListesi = await yemekRepo.tumYemekleriAl();
    emit(yemekListesi);
  }


}