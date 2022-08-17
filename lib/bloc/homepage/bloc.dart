import 'package:cambridge_wealth/bloc/homepage/event.dart';
import 'package:cambridge_wealth/bloc/homepage/state.dart';
import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:cambridge_wealth/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState>{

  HomePageBloc(HomeRepository homeRepository) : super(UnInitializedState()){

    on<FetchHomePageData>((event, emit) async {

      emit(FetchingState());
      try {

        HomePageData homePageData = await homeRepository.getData();

        emit(FetchedState(homePageData: homePageData));
      } catch (error) {
        emit(ErrorState(message: 'Something went wrong'));
      }

    });

  }


}