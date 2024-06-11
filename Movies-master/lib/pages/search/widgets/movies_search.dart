import 'package:flutter/material.dart';
import '../search_view_model.dart';

class MoviesSearch extends SearchDelegate {
  final SearchViewModel vm;

  MoviesSearch({required this.vm});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    vm.getMovies(query);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    return const Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Color(0xffB5B4B4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.white);
}
