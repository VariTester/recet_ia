class RecipeOnline{
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  

  RecipeOnline({this.name, this.images,this.rating,this.totalTime});

  factory RecipeOnline.fromJson(dynamic json){
    return RecipeOnline(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String
    );
  }

  static List<RecipeOnline> recipesFromSnapshot(List snapshot){
    return snapshot.map(
      (data){
        return RecipeOnline.fromJson(data);
      } 
    ).toList();
  }

  @override 
  String toString(){
    return 'Recipe {name: $name, inage: $images, rating: $rating, totalTime: $totalTime}';
  }


}