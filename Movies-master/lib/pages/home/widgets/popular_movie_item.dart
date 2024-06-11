import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import '../home_details/home_details_view.dart';
import '../home_view_model.dart';

class PopularMovieItem extends StatelessWidget {
  final MovieModel model;
  final HomeViewModel vm;

  const PopularMovieItem({
    super.key,
    required this.vm,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
                    child: Container(
                      width: width,
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "${Constants.imageBaseURL}${model.backdropPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Image.asset("assets/images/play_button.png"),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 20,
                    child: Row(
                      children: [
                        Stack(
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
                                width: 140,
                                height: 250,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                model.originalTitle ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge,
                                softWrap: true,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                Constants.getMovieReleaseYear(
                                    model.releaseDate!),
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 10,
                                    color: const Color(0XFFB5B4B4)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
