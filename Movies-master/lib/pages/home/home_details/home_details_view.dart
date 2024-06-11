import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../home_view_model.dart';
import 'similar_movies_view.dart';

class HomeDetailsView extends StatelessWidget {
  static String routeName = "home details";
  HomeViewModel vm = HomeViewModel();

  HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as MovieModel;
    vm.getMovieDetails(model);
    vm.getSimilarMovies(model.id!);
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) => Consumer<HomeViewModel>(
        builder: (context, vm, child) => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              model.title ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: (vm.selectedMovie == null)
              ? Container(
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Color(0xffB5B4B4),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "${Constants.imageBaseURL}${vm.selectedMovie!.backdropPath}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset("assets/images/play_button.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vm.selectedMovie!.originalTitle ?? "",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(
                                  Constants.getMovieReleaseYear(
                                      vm.selectedMovie!.releaseDate!),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  Constants.getMovieDuration(
                                      vm.selectedMovie!.runtime!),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  "${Constants.imageBaseURL}${vm.selectedMovie!.posterPath}",
                                  width: 140,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                Consumer<HomeViewModel>(
                                  builder: (context, vm, child) =>
                                      GestureDetector(
                                    onTap: () {
                                      vm.bookmarkButtonPressed(model);
                                    },
                                    child: Image.asset(
                                      (vm.selectedMovie!.isFavorite)
                                          ? 'assets/images/bookmarked.png'
                                          : 'assets/images/bookmark.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          ((vm.selectedMovie!.genres!.length) <=
                                                  3)
                                              ? 50
                                              : 75,
                                    ),
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 2.2,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: const EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            vm.selectedMovie!.genres?[index]
                                                ['name'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          vm.selectedMovie!.genres?.length,
                                    ),
                                  ),
                                  Text(
                                    vm.selectedMovie!.overview ?? "",
                                    maxLines: 5,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/Group16.png"),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${vm.selectedMovie!.voteAverage}",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SimilarMoviesView(vm: vm),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
