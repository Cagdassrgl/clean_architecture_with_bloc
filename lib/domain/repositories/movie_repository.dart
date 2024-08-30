import 'package:clean_architecture_with_bloc/domain/entities/movie_data.dart';

abstract class MovieRepository {
  Future<List<MovieData>> getTrendingMoviesOfThisWeek();
}
