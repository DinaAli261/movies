
import 'package:flutter/material.dart';

import '../model/movies/MovieSuggestionResponse.dart';
class SuggestionItem extends StatelessWidget {
  final MovieSuggestion movie;
  final double height;
  final double width;

  const SuggestionItem({
    super.key,
    required this.movie,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.antiAlias,
      height: size.height * height,
      width: size.width * width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.network(
        movie.mediumCoverImage ?? '',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            alignment: Alignment.center,
            color: Colors.grey,
            child: Icon(Icons.movie, size: 50),
          );
        },
      ),
    );
  }
}