void main() {
  int gun = 3;

  switch (gun) { // ben günü kıyaslayacağımı
    case 1: {
      print("Pazartesi");
    }
    break;
    case 2: {
      print("Salı");
    }
    break;
    case 3: {
      print("Çarşamba");
    }
    break;
    case 4: {
      print("Perşembe");
    }
    break;
    case 5: {
      print("Cuma");
    }
    break;
    case 6: {
      print("Cumartesi");
    }
    break;
    case 7: {
      print("Pazar");
    }
    break;
    // Caselerin hiçbiri sağlanmıyorsa default değeri gerçekleşir
    default: {
      print("Böyle bir gün yok");
    }

  }
}