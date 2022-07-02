class Food {
  String? sepet_yemek_id;
  String? yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String? yemek_siparis_adet;
  String? kullanici_adi;

  Food({this.sepet_yemek_id, this.yemek_id, required this.yemek_adi, required this.yemek_resim_adi, required this.yemek_fiyat, this.yemek_siparis_adet, this.kullanici_adi});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      sepet_yemek_id: json["sepet_yemek_id"] == null ? "yok" : json["sepet_yemek_id"] as String,
      yemek_id: json["yemek_id"] == null ? "yok" : json["yemek_id"] as String,
      yemek_adi: json["yemek_adi"] as String,
      yemek_resim_adi: json["yemek_resim_adi"] as String,
      yemek_fiyat: json["yemek_fiyat"] as String,
      yemek_siparis_adet: json["yemek_siparis_adet"] ?? "yok"
    );
  }
}