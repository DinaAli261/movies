import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/tabs/home_tab/widget/movie_item.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/model/movie_api_manager.dart';
import 'package:movies/providers/app_language_provider.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

import '../../../model/movies/movie_response.dart';
import '../../../utils/app_images.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final MovieApiManager _movieService = MovieApiManager();
  List<Movie> movies = [];
  bool isLoading = true;
  String error = '';
  int currentMovie = 0;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var languageProvider = AppLanguageProvider();
    return SafeArea(
      child: Scaffold(
        body: (movies.isEmpty)
            ? Center(child: CircularProgressIndicator(color: AppColors.yellow))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.network(
                  movies[currentMovie].largeCoverImage,
                  height: size.height * 0.6,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.6,
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
                Column(
                  children: [
                    Image.asset(AppImages.availableNow),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (int index, _) {
                          currentMovie = index;
                          setState(() {});
                        },
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        height: size.height * 0.35,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 20),
                      ),
                      itemCount: movies.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                            if (isLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellow,
                                ),
                              );
                            }

                            if (error.isNotEmpty) {
                              return Center(child: Text(error));
                            }

                            if (movies.isEmpty) {
                              return Center(child: Text('No movies available'));
                            }

                            final movie = movies[index];
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    movie.mediumCoverImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey,
                                        child: Icon(Icons.movie, size: 50),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                    ),
                    Image.asset(AppImages.watchNow),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.action,
                  style: AppTextStyles.regular20White,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.see_more,
                      style: AppTextStyles.regular16Yellow,
                    ),
                    Icon(
                      languageProvider.appLanguage == 'en'
                          ? Icons.arrow_forward
                          : Icons.arrow_back,
                      color: AppColors.yellow,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  return MovieItem(
                    index: index,
                    movie: movies[index],
                    height: 0.24,
                    width: 0.3395,);

                },
                itemCount: movies.length, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: size.width*0.045,); },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadMovies() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });

      final response = await _movieService.getMovies();
      setState(() {
        movies = response.data.movies;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load movies: $e';
        isLoading = false;
      });
    }
  }
}



// return Stack(
//   alignment: Alignment.topLeft,
//   children: [
//     Container(
//       clipBehavior: Clip.antiAlias,
//       height: size.height* 0.24,
//       width: size.width/2.5,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//
//       ),
//       child: Image.network(
//         movies[index].mediumCoverImage,
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.grey,
//             child: Icon(Icons.movie, size: 50),
//           );
//         },
//       ),
//     ),
//     Positioned(
//      top: 13,
//       left:13,
//       child: Container(
//         padding: EdgeInsets.all(4),
//         height: size.height * 0.03,
//         width:size.width*0.13,
//         decoration: BoxDecoration(
//           color: AppColors.black.withAlpha(150),
//         borderRadius: BorderRadius.circular(10)
//         ),
//         child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text('${movies[index].rating}',style: AppTextStyles.regular16White ,),Icon(Icons.star_rate_rounded,color: AppColors.yellow,size: 15,),],)
//       ),
//     )
//   ],
// );