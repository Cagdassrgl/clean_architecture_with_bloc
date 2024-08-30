import 'package:clean_architecture_with_bloc/domain/bloc/home_bloc.dart';
import 'package:clean_architecture_with_bloc/domain/event/home_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel {
  void fetchTrendingMovies(BuildContext context) {
    context.read<HomeBloc>().add(FetchTrendingMoviesHomeEvent());
  }
}
