import 'package:flutter/material.dart';
import 'package:movies/model/movie_api_manager.dart';

import '../model/movies/movie_response.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class MovieItem extends StatelessWidget {
  late int index;
  late Movie movie;

  MovieItem({super.key, required this.index, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: size.height * 0.24,
          width: size.width / 2.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.network(
            movie.mediumCoverImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: Icon(Icons.movie, size: 50),
              );
            },
          ),
        ),
        Positioned(
          top: 13,
          left: 13,
          child: Container(
            padding: EdgeInsets.all(4),
            height: size.height * 0.03,
            width: size.width * 0.13,
            decoration: BoxDecoration(
              color: AppColors.black.withAlpha(150),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${movie.rating}', style: AppTextStyles.regular16White),
                Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.yellow,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}