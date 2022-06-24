import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/repo/yemekler_repository.dart';


class AnasayfaCubit extends Cubit<void> {
  AnasayfaCubit():super(0);

  var yemekRepo = YemeklerRepository();



}