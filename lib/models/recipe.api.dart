
// class receta_online {
//   String name;
//   String url;

//   receta_online(name, url){
//     this.name = name;
//     this.url = url;
//   }

// }

import 'dart:convert';
import 'package:recet_ia/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:recet_ia/models/recipetwo.dart';

// const axios = require('axios');

// const options = {
//   method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {
//     limit: '4',
//     start: '0'
//   },
//   headers: {
    // 'X-RapidAPI-Key': 'e98f95a02bmsh1842462a9ba5810p1a0782jsnaf3bb760fffc',
    // 'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
//   }
// };

// try {
// 	const response = await axios.request(options);
// 	console.log(response.data);
// } catch (error) {
// 	console.error(error);
// }

class RecipeApi{

  static Future<List<RecipeOnline>> getRecipeOnline() async{
    var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',
  {"limit": "10","start": "0","tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
       "X-RapidAPI-Key": "e98f95a02bmsh1842462a9ba5810p1a0782jsnaf3bb760fffc",
	     "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
       "useQueryString" : "true"
      });
      

    Map data = jsonDecode(response.body);
    List _temp =[];

    for(var i in data['feed']){
      _temp.add(i['content']['details']);
    }

    return RecipeOnline.recipesFromSnapshot(_temp);
    
  }
}
