// import 'package:recet_ia/models/recipe.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class RecipeApi{

// static Future<List<Recipe>> getRecipe() async{
// var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',{
//     'limit': '24',
//     'start': '0',
//     'tag': 'list.recipe.popular'});

//     final response = await http.get(uri, headers: {
//     'X-RapidAPI-Key': 'e98f95a02bmsh1842462a9ba5810p1a0782jsnaf3bb760fffc',
//     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
//     'useQueryString': "true"
    
//     });
//   Map data = jsonDecode(response.body);
//   List _temp = [];

//   for(var i in data['feed']){
//     _temp.add(i['content']['details']);
//   }

//   return Recipe.recipesFromSnapshot(_temp);

// }

// }

