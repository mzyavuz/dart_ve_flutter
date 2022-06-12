class Mesajlar {
  int success;
  String message;

  Mesajlar({required this.success, required this.message});

  //{"success":1,"message":"Successfully"}
  factory Mesajlar.fromJson(Map<String, dynamic> json) {
    return Mesajlar(
        success: json["success"] as int,
        message: json["message"] as String
    );
  }
}