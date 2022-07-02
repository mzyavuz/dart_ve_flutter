
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/repo/foods_repository.dart';

class OrderPageCubit extends Cubit<List<Food>> {
  OrderPageCubit():super(<Food>[]);

  var foodRepo = FoodsRepository();

  Future<void> loadAllFoodAtCart(String kullanici_adi) async {
    var cartList = await foodRepo.getFoodsAtCart(kullanici_adi);
    var adjustedList = <Food>[];
    for (var i = 0; i < cartList.length; i++) {
      bool repeated = false;
      for (var j = 0; j < adjustedList.length; j++) {
        if (cartList[i].yemek_adi == adjustedList[j].yemek_adi) {
          repeated = true;
          adjustedList[j].yemek_siparis_adet =
              (int.parse(adjustedList[j].yemek_siparis_adet!) +
                  int.parse(cartList[i].yemek_siparis_adet!)).toString();
        }
      }
      if (!repeated) {
        adjustedList.add(cartList[i]);
      }
    }
    emit(adjustedList);
  }

  Future<void> deleteFoodFromCart(int sepet_yemek_id, String kullanici_adi) async {
    await foodRepo.deleteFoodFromCart(sepet_yemek_id, kullanici_adi);
    await loadAllFoodAtCart(kullanici_adi);
  }





}