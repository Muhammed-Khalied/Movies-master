import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_view_model.dart';
import 'recommend_movie_item.dart';

class RecommendedViewWidget extends StatelessWidget {
  final HomeViewModel vm;

  const RecommendedViewWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return (vm.recommendMovies.isEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 90.0),
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 350,
                        color: const Color(0XFF282A28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "Recommended",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    RecommendMovieItem(
                                      model: vm.recommendMovies[index],
                                  vm: vm,
                                ),
                                itemCount: vm.recommendMovies.length,
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
