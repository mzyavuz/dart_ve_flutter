class A {
  late int publicDegisken;
  late int _privateDegisken; //bu değişken sadece classlardan erişilebilir

  void metod() {
    _privateDegisken = 30;
    publicDegisken = 50;
  }
}