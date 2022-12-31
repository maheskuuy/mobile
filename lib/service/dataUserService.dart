import 'package:project_tiket/model/data_user.dart';
import 'package:http/http.dart' as http;

class UserService{
  static final String _baseUrl = 'http://10.0.2.2/Web_Server_GM/php/';
//mendapatkan/menampilkan user
  Future get_user() async{
    Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=get_dataUser');

    final response = await http.get(urlApi);
    if (response.statusCode==200) {
      return dtUserFromJson(response.body.toString()); 
    } else {
      throw Exception("failed to load data user");
    }
  }
  //insert user
  Future add_user(String id, String username, String password, String email, String kontak, String alamat, String level) async{
    Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=add_dataUser');

    final response = await http.post(urlApi, body: ({
      "Id_user": id,
      "Username": username,
      "Password": password,
      "Email": email,
      "Kontak": kontak,
      "Alamat": alamat,
      "level": level,
    }));
    if (response.statusCode==200) {
      print("Registrasi Berhasil");
      return true; 
    } else {
      print("Registrasi Gagal");
      return false;
    }
  }
  //get user (username)
   Future get_user_uername() async{
    Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=get_dtUser_username&username=');

    final response = await http.get(urlApi);
    if (response.statusCode==200) {
      return dtUserFromJson(response.body.toString()); 
    } else {
      throw Exception("failed to load data user");
    }
  }
}
