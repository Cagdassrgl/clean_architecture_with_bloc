import 'package:clean_architecture_with_bloc/data/mappers/movie_mapper.dart';
import 'package:clean_architecture_with_bloc/data/remote/movie_api.dart';
import 'package:clean_architecture_with_bloc/domain/entities/movie_data.dart';
import 'package:clean_architecture_with_bloc/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(this._movieApi);

  final MovieApi _movieApi;

  @override
  Future<List<MovieData>> getTrendingMoviesOfThisWeek() async {
    final paginatedResponse = await _movieApi.getTrendingMoviesOfThisWeek();
    final movies = paginatedResponse.results;
    final data = movies.map((e) => e.toData()).toList();

    return data;
  }
}
