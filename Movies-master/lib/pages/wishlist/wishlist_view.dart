import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/network_layer/firebase_utils.dart';
import '../../../pages/wishlist/widgets/wishlist_movie_item.dart';

import '../../models/movie_model.dart';
import '../home/home_details/home_details_view.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Wishlist',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot<MovieModel>>(
              stream: FirestoreUtils.getRealTimeDataFromFirestore(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.error.toString()),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var moviesList = snapshot.data?.docs
                    .map((element) => element.data())
                    .toList() ??
                    [];
                print('MoviesList: ${moviesList.length}');
                return (moviesList.isEmpty)
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                          Image.asset('assets/images/search_body.png'),
                          const SizedBox(height: 5),
                          const Text(
                            "No Movies Found",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff514F4F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                )
                    : ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HomeDetailsView.routeName,
                                  arguments: moviesList[index]);
                            },
                            child:
                                WatchlistMovieItem(model: moviesList[index])),
                  itemCount: moviesList.length,
                  padding: EdgeInsets.zero,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
