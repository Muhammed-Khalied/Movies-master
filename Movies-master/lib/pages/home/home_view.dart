import 'package:flutter/material.dart';

import 'home_view_model.dart';
import 'widgets/new_releases_view_widget.dart';
import 'widgets/popular_view_widget.dart';
import 'widgets/recommended_view_widget.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel vm = HomeViewModel();

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    widget.vm.getPopularMovies();
    widget.vm.getNewReleasesMovies();
    widget.vm.getRecommendMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularViewWidget(vm: widget.vm),
          NewReleasesViewWidget(vm: widget.vm),
          RecommendedViewWidget(vm: widget.vm),
        ],
      ),
    );
  }
}

