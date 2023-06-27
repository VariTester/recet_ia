
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recet_ia/consent/appbar.dart';

import 'package:recet_ia/consent/colors.dart';
import 'package:recet_ia/models/recipe.api.dart';
import 'package:recet_ia/models/recipe.dart';

import 'package:recet_ia/screen/widgets/recipe_card.dart';

class Home extends StatefulWidget{
  const Home({Key key}) : super(key: key);

  @override

  State<Home>createState() => _HomeState();


}

class _HomeState extends State<Home>{

  List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
    
  }

   Future<void> getRecipes() async {
    // _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
  }

  int indexx =0;
  List category = ['Inicio','Desayuno','Almuerzo','Cena','ChatGPT'];
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:background,
      appBar: appbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Text('Popular catehory',
              style: TextStyle(
                fontSize: 20,
                color: font,
                fontFamily: 'ro',
              ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            indexx = index;
                          });

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: indexx == index 
                                ? secundario
                                : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: indexx == index
                                    ? secundario
                                    : Colors.transparent,
                                    offset: indexx == index
                                    ? Offset(1, 1)
                                    : Offset(0, 0),
                                    blurRadius: indexx == index ? 10 : 0,
                                  )
                                ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17),
                              child: Text(
                                category[index],
                                style: TextStyle(
                                fontSize: 16,
                                color: indexx == index 
                                ? Colors.white
                                :acento,
                                fontFamily: 'ro'
                              ),),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Popular',style: TextStyle(
                                fontSize:20,
                                    color: acento,
                                    fontFamily: 'ro'
                                  ),),
                  ],
                )
              ],),
            ),
          ),
   
           RecipeCard(title: "My recipe",cookTime: '30 min',rating: '4.3',thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',)
       
       ],
      ),
      
    );
  }
}