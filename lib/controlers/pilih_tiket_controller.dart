import 'package:get/get.dart';

class PilihTiketController extends GetxController {
 
var indexKursi= 0.obs;
  var kursi =  List.generate(
      100,
      (indexK) {
          if (indexK >= 24 && indexK <= 26 || indexK >= 40 && indexK <= 44) {
            return {
              "id": "ID-${indexK + 1}",
              "status": "Tidak tersedia",
            };
          } else {
            return {
              "id": "ID-${indexK + 1}",
              "status": "tersedia",
            };
          } 
      },
    ).obs;
}
