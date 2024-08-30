import 'package:clean_architecture_with_bloc/domain/entities/movie_data.dart';
import 'package:clean_architecture_with_bloc/library/resource/colors.dart';
import 'package:clean_architecture_with_bloc/library/resource/typography.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movie,
    required this.index,
    super.key,
  });

  final MovieData movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 308,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(movie.posterUrl, fit: BoxFit.fill),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(index.toString(), style: AppTypography.text),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.primary),
                    const SizedBox(width: 2),
                    Text(movie.rating.toString(), style: AppTypography.smallTextSecondary),
                  ],
                ),
                const SizedBox(height: 4),
                Text(movie.title, style: AppTypography.smallText, maxLines: 2, softWrap: true),
              ],
            ),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
