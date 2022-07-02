import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/repo/foods_repository.dart';

class FoodsPageCubit extends Cubit<List<Food>> {
  FoodsPageCubit():super(<Food>[]);

  var foodRepo = FoodsRepository();

  Future<void> loadAllFoods() async {
    var yemekListesi = await foodRepo.getAllFoods();
    emit(yemekListesi);
  }


}