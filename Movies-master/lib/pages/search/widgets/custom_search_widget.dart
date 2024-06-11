import 'package:flutter/material.dart';

import '../search_view_model.dart';
import 'movies_search.dart';

class CustomSearchWidget extends StatelessWidget {
  final SearchViewModel vm;

  const CustomSearchWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: MoviesSearch(vm: vm),
          query: vm.searchQuery,
        );
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xff514F4F).withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              (vm.searchQuery.isEmpty) ? 'Search' : vm.searchQuery,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
