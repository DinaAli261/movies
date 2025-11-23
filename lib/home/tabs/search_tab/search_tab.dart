import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';

import '../../../model/MovieApiManager.dart';
import '../../../model/movies/movie_response.dart';
import '../home_tab/widget/movie_item.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final MovieApiManager _movieService = MovieApiManager();
  List<Movie> movies = [];
  bool isLoading = true;
  String error = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMovies();
    searchController.addListener(() {
      setState(() {
        _loadMovies();
      });
    },);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    bool isWritten = searchController.text.isNotEmpty;

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 0.06 * height,
            left: 0.037 * width,
            right: 0.037 * width,
          ),
          child: Column(
            children: [
              CustomTextFormField(
                  hasPadding: false,
                  controller: searchController,
                  hintText: AppLocalizations.of(context)!.search,
                  prefixIcon: ImageIcon(
                    AssetImage(AppImages.searchIcon), color: AppColors.white,)),
              Expanded(child: (!isWritten)
                  ? Image.asset(AppImages.emptyIcon)
                  : GridView.builder(
                padding: EdgeInsets.only(top: height * 0.013),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: height * 0.009,
                    crossAxisSpacing: 0.037 * width,
                    childAspectRatio: 191 / 297
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  //todo : reusable widget movie from api
                  return MovieItem(index: index,
                    movie: movies[index],
                    height: 0.299,
                    width: 0.444,);
                },
              )
              ),
            ],
          ),
        )
    );
  }

  Future<void> _loadMovies() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });

      final response = await _movieService.searchMovies(searchController.text);
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