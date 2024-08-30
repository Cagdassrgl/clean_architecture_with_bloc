import 'package:clean_architecture_with_bloc/domain/entities/movie_data.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialHomeState extends HomeState {}

sealed class TrendingMoviesHomeState extends HomeState {}

class FetchingTrendingMoviesHomeState extends TrendingMoviesHomeState {}

class FetchFailTrendingMoviesHomeState extends TrendingMoviesHomeState {}

class FetchedTrendingMoviewHomeState extends TrendingMoviesHomeState {
  FetchedTrendingMoviewHomeState(this.movies);

  final List<MovieData> movies;

  @override
  List<Object> get props => [movies];
}
