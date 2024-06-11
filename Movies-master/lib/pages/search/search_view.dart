import 'package:flutter/material.dart';
import 'package:movies/pages/search/widgets/search_movie_item.dart';
import 'package:provider/provider.dart';

import 'search_view_model.dart';
import 'widgets/custom_search_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel vm = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          width: MediaQuery.sizeOf(context).width,
          child: Consumer<SearchViewModel>(
            builder: (context, vm, child) {
              print('Movies in searchView: ${vm.movies.length}');
              return Column(
                children: [
                  Expanded(
                    child: (vm.movies.isEmpty)
                        ? Column(
                            children: [
                              CustomSearchWidget(vm: vm),
                              const SizedBox(
                                height: 200,
                              ),
                              Image.asset('assets/images/search_body.png'),
                              const SizedBox(height: 20),
                              Text(
                                vm.searchQuery.isEmpty
                                    ? "Type keyword to search for"
                                    : "No Movies Found",
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xff514F4F)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CustomSearchWidget(vm: vm),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      SearchMovieItem(
                                    model: vm.movies[index],
                                    vm: vm,
                                  ),
                                  itemCount: vm.movies.length,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
