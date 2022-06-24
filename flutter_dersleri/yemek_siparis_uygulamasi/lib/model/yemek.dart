class Yemek {
  String? sepet_yemek_id;
  String? yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String? yemek_siparis_adet;
  String? kullanici_adi;

  Yemek({this.sepet_yemek_id, this.yemek_id, required this.yemek_adi, required this.yemek_resim_adi, required this.yemek_fiyat, this.yemek_siparis_adet, this.kullanici_adi});

  factory Yemek.fromJson(Map<String, dynamic> json) {
    return Yemek(
      sepet_yemek_id: json["sepet_yemek_id"] ?? "yok",
      yemek_id: json["yemek_id"] ?? "yok",
      yemek_adi: json["yemek_adi"] as String,
      yemek_resim_adi: json["yemek_resim_adi"] as String,
      yemek_fiyat: json["yemek_fiyat"] as String,
      yemek_siparis_adet: json["yemek_siparis_adet"] ?? "yok",
      kullanici_adi: json["kullanici_adi"] ?? "yok"
    );
  }
}