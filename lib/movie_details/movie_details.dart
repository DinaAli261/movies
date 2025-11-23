import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/movie_details/cast_card.dart';
import 'package:movies/movie_details/stats.dart';
import 'package:movies/movie_details/suggestion_item.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';

import '../api/movies_api.dart';
import '../model/movies/MovieSuggestionResponse.dart';
import '../model/movies/movies_details_response.dart';
import '../utils/app_routes.dart';
import 'movie_details_api_manager.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MoviesDetails? movieDetails;
  List<MovieSuggestion> similarMovies = [];
  bool isLoading = true;
  String error = '';
  int currentMovie = 0;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _loadMovieData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final args = ModalRoute.of(context)!.settings.arguments as Movies;
    // var arg = ModalRoute.of(context)!.settings.arguments as Movie;
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.yellow)),
      );
    }

    if (error.isNotEmpty) {
      return Scaffold(
        body: Center(
          child: Text(error, style: TextStyle(color: Colors.white)),
        ),
      );
    }
    var currentMovie = movieDetails?.data?.movie;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
            child: Column(
              spacing: size.height * 0.015,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //todo:movie
                SizedBox(
                  height: size.height * 0.6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        currentMovie?.largeCoverImage ?? AppImages.emptyIcon,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.blackGradient1,
                              AppColors.blackGradient1,
                              AppColors.blackGradient2,
                              AppColors.blackGradient2,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.02,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: ImageIcon(
                                  AssetImage(AppImages.movieDetailsArrowBack),
                                  color: AppColors.white,
                                  size: 16,
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ImageIcon(
                                AssetImage(AppImages.movieDetailsIconSave),
                                color: AppColors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(AppImages.playIcon),
                      Positioned(
                        bottom: size.height * 0.08,
                        child: Text(
                          currentMovie?.titleEnglish ?? '',
                          style: AppTextStyles.bold24White,
                        ),
                      ),Positioned(
                        bottom: size.height * 0.03,
                        child: Text(
                         '${currentMovie?.year}',
                          style: AppTextStyles.bold24White,
                        ),
                      ),
                    ],
                  ),
                ),
                //todo:rates and stuff + button
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.watch,
                  textStyle: AppTextStyles.bold20White,
                  backgroundColor: AppColors.red,
                  borderColor: AppColors.red,
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stats(
                      icon: ImageIcon(
                        AssetImage(AppImages.movieDetailsIconHeart),
                        color: AppColors.yellow,
                        size: 28,
                      ),
                      text: '${currentMovie?.likeCount}',
                    ),
                    Stats(
                      icon: ImageIcon(
                        AssetImage(AppImages.movieDetailsIconClock),
                        color: AppColors.yellow,
                        size: 28,
                      ),
                      text: '${currentMovie?.runtime}',
                    ),
                    Stats(
                      icon: ImageIcon(
                        AssetImage(AppImages.movieDetailsIconStar),
                        color: AppColors.yellow,
                        size: 28,
                      ),
                      text: '${currentMovie?.rating}',
                    ),
                  ],
                ),
                //todo:screenshots
                Text(
                  AppLocalizations.of(context)!.screen_shots,
                  style: AppTextStyles.bold24White,
                ),
                ScreenShots(currentMovie?.largeScreenshotImage1 ?? '',size),
                ScreenShots(currentMovie?.largeScreenshotImage2 ?? '',size),
                ScreenShots(currentMovie?.largeScreenshotImage3 ?? '',size),
                //todo:similar
                Text(
                  AppLocalizations.of(context)!.similar,
                  style: AppTextStyles.bold24White,
                ),
                SizedBox(
                  height: size.height * 0.65,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: size.height * 0.017,
                        crossAxisSpacing: size.width * 0.04,
                        childAspectRatio: 189 / 279
                    ),
                    scrollDirection: Axis.vertical,


                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.movieDetailsRouteName,
                            arguments: {'movieId': similarMovies[index].id},
                          );
                        },
                        child: SuggestionItem(
                          movie: similarMovies[index],
                          height: 0.2993,
                          width: 0.4395,
                          rating: similarMovies[index].rating as double,
                        ),
                      );
                    },
                    itemCount: similarMovies.length,

                  ),
                ),
                //todo: summary
                Text(
                  AppLocalizations.of(context)!.summary,
                  style: AppTextStyles.bold24White,
                ),
                Text(
                  movieDetails?.data?.movie?.descriptionFull ?? 'asdfasd',
                  style: AppTextStyles.regular16White,
                ),
                //todo:cast
                Text(
                  AppLocalizations.of(context)!.cast,
                  style: AppTextStyles.bold24White,
                ),
                ...List.generate(
                  currentMovie?.cast?.length ?? 0,
                      (index) => CastCard(
                    imgUrl: currentMovie?.cast?[index].urlSmallImage ?? '',
                    role: currentMovie?.cast?[index].characterName ?? '',
                    name: currentMovie?.cast?[index].name ?? '',
                  ),
                ),
                //todo:genres
                Text(
                  AppLocalizations.of(context)!.genres,
                  style: AppTextStyles.bold24White,
                ),
                Genres(currentMovie?.genres, size),
                SizedBox(
                  height: size.height * 0.06,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Genres(List<String>? genres, Size size) {
    if (genres == null || genres.isEmpty) {
      return SizedBox(); // Return empty if no genres
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: genres.map((genre) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025,
            vertical: size.height * 0.012,
          ),
          width: size.width * 0.28,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(genre, style: AppTextStyles.regular16White),
        );
      }).toList(),
    );
  }

  Widget ScreenShots(String imgUrl, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: size.height * 0.1,
            color: AppColors.grey,
            alignment: Alignment.center,
            child: Icon(Icons.photo, color: AppColors.white, size: 50),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppColors.grey,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.yellow),
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadMovieData() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });
      // GET DETAILS OF CLICKED MOVIE
      final detailsResponse = await MovieDetailsApiManager.getMovieDetails(
        moviesId: widget.movieId,
      );

      //  GET SIMILAR MOVIES TO CLICKED MOVIE
      final suggestionsResponse = await MoviesApi.getMovieSuggestions(
        movieId: widget.movieId,
      );

      setState(() {
        movieDetails = detailsResponse;
        similarMovies = suggestionsResponse.movies ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load movie data: $e';
        isLoading = false;
      });
    }
  }
}