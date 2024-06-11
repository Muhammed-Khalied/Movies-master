import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../models/movie_model.dart';
import '../home_details/home_details_view.dart';
import '../home_view_model.dart';

class NewReleasesMovieItem extends StatelessWidget {
  final MovieModel model;
  final HomeViewModel vm;

  const NewReleasesMovieItem({
    super.key,
    required this.model,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, HomeDetailsView.routeName,
              arguments: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                    "${Constants.imageBaseURL}${model.posterPath}"),
              ),
              Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return GestureDetector(
                    onTap: () {
                      vm.bookmarkButtonPressed(model);
                    },
                    child: Image.asset(
                      (model.isFavorite!)
                          ? 'assets/images/bookmarked.png'
                          : 'assets/images/bookmark.png',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
