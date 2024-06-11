import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_view_model.dart';
import 'new_releases_movie_item.dart';

class NewReleasesViewWidget extends StatelessWidget {
  final HomeViewModel vm;

  const NewReleasesViewWidget({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return (vm.newReleaseMovies.isEmpty)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 90.0),
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 250,
                        color: const Color(0XFF282A28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "New Releases",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return NewReleasesMovieItem(
                                    model: vm.newReleaseMovies[index],
                                    vm: vm,
                                  );
                                },
                                itemCount: vm.newReleaseMovies.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}
