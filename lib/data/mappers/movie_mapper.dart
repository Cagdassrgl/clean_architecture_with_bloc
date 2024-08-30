import 'package:clean_architecture_with_bloc/app/utils/app_utils.dart';
import 'package:clean_architecture_with_bloc/data/remote/responses/movie_response.dart';
import 'package:clean_architecture_with_bloc/domain/entities/movie_data.dart';

extension MovieMapper on MovieResponse {
  MovieData toData() => MovieData(
        id: id,
        title: title,
        rating: voteAverage,
        posterUrl: AppUtils.addBaseImageUrl(posterPath),
      );
}
