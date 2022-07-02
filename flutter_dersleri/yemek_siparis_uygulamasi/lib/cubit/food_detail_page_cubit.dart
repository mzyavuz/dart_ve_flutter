import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/repo/foods_repository.dart';


class FoodDetailPageCubit extends Cubit<void> {
  FoodDetailPageCubit():super(0);

  var foodRepo = FoodsRepository();

  Future<void> addToCart(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    await foodRepo.addFoodToCart(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }


}