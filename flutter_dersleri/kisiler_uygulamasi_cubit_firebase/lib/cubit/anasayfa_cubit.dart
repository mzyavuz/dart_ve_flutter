import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler"); //Kisiler diye bir referans noktam var ona erişmek için izni ver

  Future<void> kisileriYukle() async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){
        var liste = <Kisiler>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          liste.add(kisi);
        });
        emit(liste);
      }
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    /* EQUAL TO
    var sorgu = refKisiler.orderByChild("kisi_ad").equalTo(aramaKelimesi);
    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){
        var liste = <Kisiler>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          liste.add(kisi);
          emit(liste);
        });
      }
    });
     */

    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){
        var liste = <Kisiler>[];

        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          if (kisi.kisi_ad.contains(aramaKelimesi)){
            liste.add(kisi);
          }
        });
        emit(liste);
      }
    });

  }

  Future<void> sil(String kisi_id) async {
    await krepo.kisiSil(kisi_id);
  }
}