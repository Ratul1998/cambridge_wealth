class HomePageData {

  final List<String> values;
  final List<String> titles;
  final String description;
  final List<HomePageCardData> homePageCards;

  HomePageData({required this.values, required this.titles, required this.description, required this.homePageCards});

  factory HomePageData.fromJson(Map<String,dynamic> map){

    List<String> getList(List<dynamic> list){
      List<String> temp = [];
      for (var element in list) {temp.add(element.toString());}
      return temp;
    }

    List<HomePageCardData> getCardsList(List<dynamic> list){
      List<HomePageCardData> temp = [];
      for (var element in list) {temp.add(HomePageCardData.fromJson(element));}
      return temp;
    }

    return HomePageData(

      description: map['description'],
      values: getList(map['values']),
      titles: getList(map['titles']),
      homePageCards: getCardsList(map['homePageCards']),

    );

  }

}

class HomePageCardData {

  final String description;
  final String rating;

  HomePageCardData({required this.description,required this.rating});

  factory HomePageCardData.fromJson(Map<String,dynamic> map){

    return HomePageCardData(
      description: map['description'],
      rating: map['rating'],
    );

  }

}