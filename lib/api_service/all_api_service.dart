import 'dart:convert';

import 'package:apipractice/api_service/model.dart';
import 'package:apipractice/api_service/second_model.dart';
import 'package:http/http.dart ' as http;

Future<Welcome> getData1()async{
  Welcome welcome =  Welcome();
  final url = Uri.parse("https://api.seatgeek.com/2/events?client_id=Mjk1OTM0MzN8MTY2NTIzNTExNy44OTEwODc&q=new york");
  http.Response response =await  http.get(url);

  if(response.statusCode == 200){
    welcome = welcomeFromJson(response.body);
  }
  else{
    print(response.reasonPhrase);
  }
  return welcome;

}

Future<BollyWoodData>getBollyWood()
async {
  BollyWoodData bollyWoodData = BollyWoodData();
  final Url = Uri.parse("http://165.22.221.141/n1/api/get_category_videos?id=35&page=1&count=20&sort=n.id%20DESC&api_key=cda11xgk4i3Sp8NTYMreCnjAGvzQVXHsfJbwZPULqlyD1aI26m");
  http.Response response =await http.get(Url);
   var resultBollyWoodData = jsonDecode(response.body);

  if(response.statusCode == 200)
    {
      bollyWoodData = BollyWoodData.fromJson(resultBollyWoodData);
    }
  else
    {
      print(response.reasonPhrase);
    }
  return bollyWoodData;
}








