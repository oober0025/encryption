class Encryption {
  static String encode(String s) {
    String ini = "11111111";
    int cu = 0;

    List<int> arr = List.filled(11111111, 0);

    for (int i = 0; i < s.length; i++) {
      arr[i] = s.codeUnitAt(i);
      cu++;
    }

    String res = "";

    List<int> bin = List.filled(111, 0);
    int idx = 0;

    for (int i1 = 0; i1 < cu; i1++) {
      int temp = arr[i1];

      for (int j = 0; j < cu; j++) {
        bin[j] = 0;
      }
      idx = 0;

      while (temp > 0) {
        bin[idx++] = temp % 2;
        temp = temp ~/ 2;
      }

      String dig = "";
      String temps;

      for (int j = 0; j < 7; j++) {
        temps = bin[j].toString();
        dig = dig + temps;
      }

      String revs = "";

      for (int j = dig.length - 1; j >= 0; j--) {
        String ca = dig[j];
        revs = revs + ca;
      }

      res = res + revs;
    }

    res = ini + res;
    return res;
  }
}

class Decryptiion {
  static String decode(String s) {
    String invalid = "Invalid Code";

    String ini = "11111111";
    bool flag = true;

    for (int i = 0; i < 8; i++) {
      if (ini[i] != s[i]) {
        flag = false;
        break;
      }
    }

    String val = "";

    for (int i = 8; i < s.length; i++) {
      val += s[i];
    }

    List<List<int>> arr = List.generate(11101, (_) => List.filled(8, 0));
    int ind1 = -1;
    int ind2 = 0;

    for (int i = 0; i < val.length; i++) {
      if (i % 7 == 0) {
        ind1++;
        ind2 = 0;
        int ch = int.parse(val[i]);
        arr[ind1][ind2] = ch;
        ind2++;
      } else {
        int ch = int.parse(val[i]);
        arr[ind1][ind2] = ch;
        ind2++;
      }
    }

    List<int> num = List.filled(11111, 0);
    int nind = 0;
    int tem = 0;
    int cu = 0;

    for (int i = 0; i <= ind1; i++) {
      cu = 0;
      tem = 0;
      for (int j = 6; j >= 0; j--) {
        int tem1 = (1 << cu);
        tem += (arr[i][j] * tem1);
        cu++;
      }
      num[nind++] = tem;
    }

    String ret = "";
    String ch = "";

    for (int i = 0; i < nind; i++) {
      ch = String.fromCharCode(num[i]);
      ret += ch;
    }

    if (val.length % 7 == 0 && flag == true) {
      return ret;
    } else {
      return invalid;
    }
  }
}
