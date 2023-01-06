import 'package:project_tiket/model/data_user.dart';
import 'package:http/http.dart' as http;

class transaksiService{
  static final String _baseUrl = 'http://10.0.2.2/Web_Server_GM/php/';
// //mendapatkan/menampilkan user
//   Future get_user() async{
//     Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=add_transaksi');

//     final response = await http.get(urlApi);
//     if (response.statusCode==200) {
//       return dtUserFromJson(response.body.toString()); 
//     } else {
//       throw Exception("failed to load data user");
//     }
//   }
  //insert user
  Future add_transaksi(String id, String waktu, String IdUser, String IdJadwal, String Id_studio) async{
    Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=add_transaksi');

    final response = await http.post(urlApi, body: ({
      "Id_transaksi": id,
      "Waktu": waktu,
      "Id_user": IdUser,
      "Id_jadwal": IdJadwal,
      "Id_studio": Id_studio,
    }));
    if (response.statusCode==200) {
      print("Transaksi Berhasil");
      return true; 
    } else {
      print("Transaksi Gagal");
      return false;
    }
  }
}
