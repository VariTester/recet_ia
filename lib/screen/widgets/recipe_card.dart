import 'package:flutter/material.dart';
import 'package:recet_ia/consent/colors.dart';
import 'package:recet_ia/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  // final String ingredient;
  // final String directionsUrl;
  RecipeCard({
    @required this.title,
    @required this.cookTime,
    @required this.rating,
    @required this.thumbnailUrl,

    // @required this.ingredient,
    // @required this.directionsUrl,
  });
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
              (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 185, 185, 185),
                      offset: Offset(1 , 1),
                      blurRadius: 15,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_border)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          //ACA ESTA LAS IMAGENES DE LAS RECETAS
                          image: NetworkImage(thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //ACA ESTA EL TITULO DE LAS RECETAS
                  Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: acento,
                    fontFamily: 'ro',
                    ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          cookTime,style: TextStyle(
                    fontSize: 15,
                    color: secundario,
                    fontFamily: 'ro',
                    ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: maincolor,size: 15),
                        Text(
                          rating,style: TextStyle(
                          fontSize: 15,
                          color: secundario,
                          fontFamily: 'ro',
                    ),
                    ),
                      ],
                    ),
                      ],
                    ),
                ],),
              );
            },
            //esto es para coontrolar los espacios principales del background
            childCount: 10,
            ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //Largo de las cajas
              mainAxisExtent: 300,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
          
              ),
            ),
          );
  }
}

