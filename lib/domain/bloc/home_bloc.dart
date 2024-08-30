import 'dart:async';

import 'package:clean_architecture_with_bloc/domain/bloc/base_bloc.dart';
import 'package:clean_architecture_with_bloc/domain/event/home_event.dart';
import 'package:clean_architecture_with_bloc/domain/repositories/movie_repository.dart';
import 'package:clean_architecture_with_bloc/domain/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._movieRepository) : super(InitialHomeState()) {
    on<FetchTrendingMoviesHomeEvent>(_handleFetchTrendingMovies);
  }
  final MovieRepository _movieRepository;

  Future<void> _handleFetchTrendingMovies(FetchTrendingMoviesHomeEvent event, Emitter<HomeState> emit) async {
    emit(FetchingTrendingMoviesHomeState());

    try {
      final movies = await _movieRepository.getTrendingMoviesOfThisWeek();
      emit(FetchedTrendingMoviewHomeState(movies));
    } on Object catch (_) {
      emit(FetchFailTrendingMoviesHomeState());
    }
  }
}
