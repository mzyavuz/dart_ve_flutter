void main() {

  //3,4,5
  for (var i=3; i<6; i++) {
    print("i : $i");
  }

  //10 ile 20 arasında 5 er artması
  for (var y=10; y<=20; y+=5) {
    print("y : $y");
  }

  //20 ile 10 arasında 5er azalması
  for (var z=20; z >= 10; z-=5) {
    print("z : $z");
  }


  //1,2,3
  int sayac = 1;

  while (sayac < 4) {
    print("while: $sayac");
    sayac+=1;
  }

  //1 ile 5
  for (var i=1; i<6; i++) {
    print("Break : $i");
    if (i ==3) {
      break; //döngü durdu
    }
  }

  for (var i=1; i<6; i++) {
    if (i ==3) {
      continue; // 3'ü pas geçecek
    }
    print("Continue : $i");
  }

}