import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/core/network_layer/firebase_utils.dart';
import 'package:movies/models/movie_model.dart';

class WatchlistMovieItem extends StatelessWidget {
  final MovieModel model;

  const WatchlistMovieItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${Constants.imageBaseURL}${model.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FirestoreUtils.deleteDataFromFirestore(model.id!);
                    },
                    child: Image.asset(
                      (model.isFavorite!)
                          ? 'assets/images/bookmarked.png'
                          : 'assets/images/bookmark.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Year: ${Constants.getMovieReleaseYear(model.releaseDate ?? '')}',
                        style: const TextStyle(
                            color: Colors.white), // Adjust style as needed
                      ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: const Divider(
            height: 2,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
