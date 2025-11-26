import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';
import '../../../model/MovieApiManager.dart';
import '../../../model/movies/movie_response.dart';
import '../home_tab/widget/movie_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final MovieApiManager _movieService = MovieApiManager();
  List<Movie> movies = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Set<String> genresSet = {};
    for (var movie in movies) {
      genresSet.addAll(movie.genres);
    }
    List<String> genres = genresSet.toList();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 0.06 * height,
          left: 0.037 * width,
          right: 0.037 * width,
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: AppColors.yellow))
            : error.isNotEmpty
            ? Center(child: Text(error))
            : DefaultTabController(
                length: genres.length,
                child: Column(
            children: [
              TabBar(
                tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.only(right: width * 0.019),
                      isScrollable: true,
                dividerColor: AppColors.transparent,
                labelStyle: AppTextStyles.bold20Black,
                unselectedLabelStyle: AppTextStyles.bold20Yellow,
                indicator: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                      tabs: genres.map((text) {
                        return Container(
                    padding: EdgeInsets.symmetric(
                            vertical: height * 0.013,
                            horizontal: 0.032 * width,
                          ),
                          decoration: BoxDecoration(
                      border: Border.all(color: AppColors.yellow),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(text),
                  );
                }).toList(),
              ),

              Expanded(
                child: TabBarView(
                  children: List.generate(genres.length, (index) {
                          String currentGenre = genres[index];
                          List<Movie> filteredMovies = movies
                              .where(
                                (movie) => movie.genres.contains(currentGenre),
                              )
                              .toList();

                          return (filteredMovies.isEmpty? Center(
                            child: Text(
                              "No movies found",
                              style: AppTextStyles.bold20Yellow,
                            ),
                          )
                          : GridView.builder(
                            padding: EdgeInsets.only(
                                top: height * 0.027),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: height * 0.009,
                          crossAxisSpacing: 0.037 * width,
                          childAspectRatio: 191 / 297,
                        ),
                            itemCount: filteredMovies.length,
                            itemBuilder:
                                (context, movieIndex) {
                          return MovieItem(
                            index: movieIndex,
                            movie: filteredMovies[movieIndex],
                            height: 0.299,
                            width: 0.444,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
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
