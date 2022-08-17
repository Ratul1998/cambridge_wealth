import 'package:cambridge_wealth/models/home_page_data.dart';

abstract class HomePageState{}

class UnInitializedState extends HomePageState{}

class FetchingState extends HomePageState{}

class FetchedState extends HomePageState{

  final HomePageData homePageData;

  FetchedState({required this.homePageData});

}

class ErrorState extends HomePageState{

  final String message;

  ErrorState({required this.message});


}