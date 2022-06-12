import 'package:bloc/bloc.dart';
import 'package:odev_6_lokma/model/yemek.dart';
import 'package:odev_6_lokma/repo/yemekler_repo.dart';


class YemeklerCubit extends Cubit<List<Yemek>> {
  YemeklerCubit() : super(<Yemek>[]);

  var repo = YemeklerRepository();

  Future<void> yemekleriYukle() async {
    var yemek_liste = await repo.yemekleriGetir();
    emit(yemek_liste);
  }
}
