import 'package:flutter/material.dart';

import '../../../models/genre_model.dart';

class CategoryItem extends StatelessWidget {
  final GenreModel model;

  const CategoryItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/thumbnail.png'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        model.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
