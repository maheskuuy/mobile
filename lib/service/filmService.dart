// import 'package:project_tiket/model/film.dart';
// import 'package:http/http.dart' as http;

// class FilmService{
//   static final String _baseUrl = 'http://10.0.2.2/Web_Server_GM/php/';

//   Future get_film() async{
//     Uri urlApi = Uri.parse(_baseUrl + 'restAPI.php?function=get_film');

//     final response = await http.get(urlApi);
//     if (response.statusCode==200) {
//       return filmFromJson(response.body.toString()); 
//     } else {
//       throw Exception("failed to load data film");
//     }
//   }
// }
