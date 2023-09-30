import 'package:http/http.dart' as http ;

class Api {
  final String Url = "http://192.168.253.75:4000/";

  authData(data, apiUrl) async {
    var fullUrl = Url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async {
    var fullUrl = Url + apiUrl;
    return await http.get(Uri.parse(fullUrl),
    );
  }
  updateData(dta,apiUrl) async{
    var fullUrl = Url + apiUrl;
    return await http.patch(Uri.parse(fullUrl),
    );
  }
}