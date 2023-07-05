// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:recet_ia/consent/colors.dart';
import 'package:recet_ia/screen/home.dart';



class Recipe extends StatelessWidget{
  // const Recipe({key});
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  Recipe({
    @required this.title,
    @required this.cookTime,
    @required this.rating,
    @required this.thumbnailUrl,
  });

@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network((thumbnailUrl),
            fit: BoxFit.cover),
          ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(10),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            
            ),
            color: Colors.white
            ),
            child: Column(children: [
              SizedBox(height: 15),
              Container(
                width: 80,
                height: 4,
                color: secundario,
              )
            ]),
          ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                radius: 18,
                child: Icon(Icons.favorite_border,size: 25,color: font,),
              ),
            ),
          ],
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                radius: 18,
                child: GestureDetector(
                  onTap:() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                        return Home();
                      },
                      ),
                      );
                  }, 
                  child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: font,
                ),
                ),
              ),
            ),
        ),
        SliverToBoxAdapter(
          child: _getbody(),
        )
      ]),
    ),
  );
}
  Widget _getbody(){
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/flash.png'),
                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/meat.png'),
                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/calories.png'),
                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/star.png'),
                ),
              ],
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '120',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                  ),
                  ),
                  Text(
                  '150',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                  ),
                  ),
                  Text(
                  '10',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                  ),
                  ),
                  Text(
                  '4.4',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                  ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(children: [
                Text('Ingredientes',
                style: TextStyle(
                    fontSize: 20,
                    color: font,
                    fontFamily: 'ro',
                    ),)
              ],),
            ),
            SizedBox(height: 15),
            Container( 
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1,1),
                    color: Colors.grey,
                    blurRadius: 7,
                  )
                ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Image.asset('images/cheese.png'),
                    Text('150g',
                  style: TextStyle(
                    fontSize: 15,
                    color: font,
                    fontFamily: 'ro',
                  ),)
                  ]),
                ),
            ),
          ],
          ),
        ),
      ],
    );
  }
}

