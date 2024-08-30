import 'package:clean_architecture_with_bloc/app/ui/screens/main/home/home_screen_view_model.dart';
import 'package:clean_architecture_with_bloc/app/ui/screens/main/home/widgets/movie_item.dart';
import 'package:clean_architecture_with_bloc/domain/bloc/home_bloc.dart';
import 'package:clean_architecture_with_bloc/domain/state/home_state.dart';
import 'package:clean_architecture_with_bloc/library/resource/colors.dart';
import 'package:clean_architecture_with_bloc/library/resource/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.viewModel, super.key});

  final HomeScreenViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.fetchTrendingMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white30,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Padding(padding: EdgeInsets.only(left: 16.0), child: Text('Trending this week', style: AppTypography.title)),
            const SizedBox(height: 16),
            SizedBox(
              height: 308,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => current is TrendingMoviesHomeState,
                builder: (context, state) {
                  if (state is FetchedTrendingMoviewHomeState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.movies.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return Row(
                          children: [
                            if (index == 0) const SizedBox(width: 16),
                            MovieItem(movie: movie, index: index + 1),
                            if (index == state.movies.length - 1) const SizedBox(width: 16),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
