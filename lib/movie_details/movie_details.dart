import 'package:flutter/material.dart';
import 'package:movies/model/movies/movie_response.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Movie;
    return Container();
  }
}
//// movie =Movie(id: movie?.id??7, title: movie?.title??"", titleEnglish: movie?.titleEnglish??'', year: movie?.year??200, rating:movie?.rating??2.0,
//     //     mediumCoverImage: movie?.mediumCoverImage??'', largeCoverImage: movie?.largeCoverImage??'', genres: movie?.genres??[], runtime: movie?.runtime??0);
//     return FutureBuilder<MoviesDetailsResponse>(
//         future:MovieApiManager.getMovieDetails(arg.id) ,
//         builder: (context, snapshot) {
//            print(snapshot.error.toString());
//
//            print(snapshot.connectionState);
//            print(snapshot.data?.status);
//            print(arg.id);
//
//           return Column(
//             children: [
//
//               Text(arg.title,style: AppTextStyles.bold24White,),
//                Image.network(arg.mediumCoverImage),
//
//
//
//             ],
//           ) ;
//         },);
//MoviesDetailsResponse moviesDetailsResponse=MoviesDetailsResponse();
//    //Movies?movies;