import 'package:yemek_siparis_uygulamasi/model/food.dart';

class TheUser {
  String id;
  String username;
  String name;
  String surname;
  String email;
  bool anonymous;
  List<Food>? order;
  double? total_price;

  TheUser({required this.id, required this.username, required this.name, required this.surname, required this.email, required this.anonymous, this.order, this.total_price});
}