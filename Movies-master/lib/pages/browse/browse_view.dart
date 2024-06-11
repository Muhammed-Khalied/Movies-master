import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'browse_view_model.dart';
import 'widgets/category_item.dart';
import 'widgets/genre_view.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  var vm = BrowseViewModel();

  @override
  void initState() {
    vm.getGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Browse Category',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Consumer<BrowseViewModel>(
                builder: (context, vm, child) {
                  return Expanded(
                    child: (vm.genres.isEmpty)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 7 / 4,
                              mainAxisSpacing: 35,
                              crossAxisSpacing: 35,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  GenreView.routeName,
                                  arguments: vm.genres[index],
                                );
                              },
                              child: CategoryItem(model: vm.genres[index]),
                            ),
                            itemCount: vm.genres.length,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
