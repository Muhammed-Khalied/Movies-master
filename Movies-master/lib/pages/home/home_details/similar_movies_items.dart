import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import 'home_details_view.dart';

class SimilarMoviesItem extends StatelessWidget {
  final MovieModel model;
  final HomeViewModel vm;

  const SimilarMoviesItem({
    super.key,
    required this.model,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: 150,
          height: 350,
          child: Card(
            color: const Color(0xff343534),
            elevation: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HomeDetailsView.routeName,
                              arguments: model,
                            );
                          },
                          child: Image.network(
                            "${Constants.imageBaseURL}${model.posterPath}",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Consumer<HomeViewModel>(
                          builder: (context, vm, child) => GestureDetector(
                            onTap: () {
                              vm.bookmarkButtonPressed(model);
                            },
                            child: Image.asset(
                              (model.isFavorite!)
                                  ? 'assets/images/bookmarked.png'
                                  : 'assets/images/bookmark.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage("assets/images/star_rate.png"),
                            color: Color(0xffFFBB3B),
                          ),
                          Text(
                            "${model.voteAverage}",
                            style: const TextStyle(
                                color: Colors.white), // Adjust style as needed
                          ),
                        ],
                      ),
                      Text(
                        "${model.title}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white), // Adjust style as needed
                      ),
                      const SizedBox(height: 5),
                      Text(
                        Constants.getMovieReleaseYear(model.releaseDate!),
                        style: const TextStyle(
                          color: Color(0XFFB5B4B4),
                        ), // Adjust style as needed
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
